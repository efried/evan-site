module Page.Projects exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.Http
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Github.Enum.OrderDirection exposing (OrderDirection(..))
import Github.Enum.RepositoryAffiliation exposing (RepositoryAffiliation(..))
import Github.Enum.RepositoryOrderField exposing (RepositoryOrderField(..))
import Github.Enum.RepositoryPrivacy exposing (RepositoryPrivacy(..))
import Github.Object
import Github.Object.Repository
import Github.Object.RepositoryConnection
import Github.Object.RepositoryEdge
import Github.Object.User
import Github.Query as Query
import Github.Scalar
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Head
import Head.Seo as Seo
import OptimizedDecoder
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Secrets as Secrets
import Pages.Url
import Path
import Request
import Shared
import Style
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Project =
    { name : String
    , description : Maybe String
    , homepage : Maybe String
    , htmlUrl : String
    }


type alias GithubUser =
    { repositories : List Project
    }


type alias Data =
    List Project


repositorySelection : SelectionSet Project Github.Object.Repository
repositorySelection =
    SelectionSet.map4 Project
        Github.Object.Repository.name
        Github.Object.Repository.description
        (Github.Object.Repository.homepageUrl
            |> SelectionSet.map
                (Maybe.map toUriString)
        )
        (Github.Object.Repository.url
            |> SelectionSet.map toUriString
        )


repositories : SelectionSet (List Project) Github.Object.User
repositories =
    Github.Object.User.repositories
        (\optionals ->
            { optionals
                | first = Present 100
                , orderBy = Present { field = Name, direction = Asc }
                , ownerAffiliations = Present [ Just Owner ]
                , affiliations = Present [ Just Owner ]
                , privacy = Present Public
                , isFork = Present False
            }
        )
        (Github.Object.RepositoryConnection.edges
            (Github.Object.RepositoryEdge.node
                repositorySelection
                |> SelectionSet.nonNullOrFail
            )
            |> SelectionSet.nonNullOrFail
            |> SelectionSet.nonNullElementsOrFail
        )


query =
    Query.user { login = "efried" } <|
        (SelectionSet.succeed GithubUser |> with repositories)


data : DataSource Data
data =
    Request.staticGraphqlRequest
        "https://api.github.com/graphql"
        query
        |> DataSource.map
            (\userMaybe ->
                case userMaybe of
                    Nothing ->
                        []

                    Just user ->
                        user.repositories
            )


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "evanfriedenberg.com"
        , image =
            { url = Pages.Url.fromPath (Path.join [ "images", "avatar.webp" ])
            , alt = "evan avatar"
            , dimensions = Just { width = 320, height = 320 }
            , mimeType = Just "image/webp"
            }
        , description = "Personal projects I've made"
        , locale = Nothing
        , title = "Projects"
        }
        |> Seo.website



---- VIEW ----


viewProject : Project -> Element msg
viewProject project =
    column
        [ width (fill |> minimum 315)
        , height (px 200)
        , padding 10
        , Border.solid
        , Border.width 2
        , Border.rounded 6
        , mouseOver
            [ Border.shadow
                { blur = 1
                , size = 1
                , offset = ( 1, 1 )
                , color = Style.primary
                }
            , moveUp 2
            , moveLeft 2
            ]
        ]
        [ row
            [ Font.size 24
            , Font.color Style.secondary
            , width fill
            , spacingXY 0 10
            ]
            [ text project.name
            ]
        , column []
            [ paragraph [ paddingXY 0 10 ]
                [ text
                    (case project.description of
                        Nothing ->
                            "No description."

                        Just description ->
                            description ++ "."
                    )
                ]
            , newTabLink [ Font.bold, Font.underline, Font.color Style.link ]
                { url = project.htmlUrl
                , label = text "View it on Github"
                }
            , case
                project.homepage
                    |> Maybe.andThen validateNonEmptyString
              of
                Nothing ->
                    none

                Just homepage ->
                    el [ paddingXY 0 10 ]
                        (newTabLink
                            [ Font.bold, Font.underline, Font.color Style.link, spacingXY 0 15 ]
                            { url = homepage
                            , label = text "Try it out!"
                            }
                        )
            ]
        ]


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Projects"
    , body =
        el
            []
            (wrappedRow
                [ spacing 10
                , padding 20
                ]
                (List.map
                    viewProject
                    static.data
                )
            )
    }



---- UTILS ----


toUriString : Github.Scalar.Uri -> String
toUriString (Github.Scalar.Uri uri) =
    uri


validateNonEmptyString : String -> Maybe String
validateNonEmptyString s =
    if String.isEmpty s then
        Nothing

    else
        Just s
