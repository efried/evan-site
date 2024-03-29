module Page.Projects exposing (Data, Model, Msg, Project, RouteParams, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Github.Enum.LanguageOrderField exposing (LanguageOrderField(..))
import Github.Enum.OrderDirection exposing (OrderDirection(..))
import Github.Enum.RepositoryAffiliation exposing (RepositoryAffiliation(..))
import Github.Enum.RepositoryOrderField exposing (RepositoryOrderField(..))
import Github.Enum.RepositoryPrivacy exposing (RepositoryPrivacy(..))
import Github.Object
import Github.Object.Language as Language
import Github.Object.LanguageConnection
import Github.Object.Repository as Repository
import Github.Object.RepositoryConnection
import Github.Object.User as User
import Github.Query as Query
import Github.Scalar
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, with)
import Head
import Head.Seo as Seo
import HexColor
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path
import Request
import Shared
import Style exposing (hexStringToColor)
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


type alias Language =
    { name : String
    , color : Maybe Color
    }


type alias Project =
    { name : String
    , description : Maybe String
    , homepage : Maybe String
    , htmlUrl : String
    , languages : List Language
    }


type alias GithubUser =
    { repositories : List Project
    }


type alias Data =
    List Project


languagesSelection : SelectionSet (List Language) Github.Object.Repository
languagesSelection =
    Repository.languages
        (\optionals ->
            { optionals
                | first = Present 10
                , orderBy = Present { field = Size, direction = Desc }
            }
        )
        (Github.Object.LanguageConnection.nodes
            (SelectionSet.succeed Language
                |> SelectionSet.with Language.name
                |> SelectionSet.with
                    (Language.color
                        |> SelectionSet.map
                            (Maybe.map
                                (\s ->
                                    String.toLower s
                                        |> HexColor.fromString
                                        |> Maybe.map hexStringToColor
                                        |> flatten
                                )
                            )
                        |> SelectionSet.nonNullOrFail
                    )
            )
            |> SelectionSet.nonNullOrFail
        )
        |> SelectionSet.nonNullOrFail
        |> SelectionSet.nonNullElementsOrFail


repositorySelection : SelectionSet Project Github.Object.Repository
repositorySelection =
    SelectionSet.succeed Project
        |> SelectionSet.with Repository.name
        |> SelectionSet.with Repository.description
        |> SelectionSet.with (SelectionSet.map (Maybe.map toUriString) Repository.homepageUrl)
        |> SelectionSet.with (SelectionSet.map toUriString Repository.url)
        |> SelectionSet.with languagesSelection


repositories : SelectionSet (List Project) Github.Object.User
repositories =
    User.repositories
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
        (Github.Object.RepositoryConnection.nodes
            repositorySelection
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
        , siteName = "Evan Friedenberg"
        , image =
            { url = Pages.Url.fromPath (Path.join [ "images", "avatar.webp" ])
            , alt = "logo"
            , dimensions = Just { width = 320, height = 320 }
            , mimeType = Just "image/webp"
            }
        , description = "Personal projects I've made"
        , locale = Nothing
        , title = "Projects | Evan Friedenberg"
        }
        |> Seo.website


viewLanguages : List Language -> Element msg
viewLanguages languages =
    paragraph [ paddingEach { top = 10, bottom = 16, left = 0, right = 0 } ]
        (List.map
            (\language ->
                let
                    color =
                        case language.color of
                            Just clr ->
                                clr

                            Nothing ->
                                Style.primary
                in
                el
                    [ Border.widthEach { top = 0, bottom = 4, left = 0, right = 0 }
                    , Border.color color
                    ]
                    (text language.name)
            )
            languages
            |> List.intersperse
                (text ", ")
        )


viewProject : Project -> Element msg
viewProject project =
    column
        [ width (fill |> minimum 315)
        , height (fill |> minimum 200 |> maximum 250)
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
            [ Font.size Style.fontSizes.header3
            , Font.color Style.secondary
            , width fill
            , spacingXY 0 10
            ]
            [ text project.name
            ]
        , column []
            [ paragraph [ paddingEach { top = 10, right = 0, bottom = 0, left = 0 } ]
                [ text
                    (case project.description of
                        Nothing ->
                            "No description."

                        Just description ->
                            description ++ "."
                    )
                ]
            , viewLanguages project.languages
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
    { title = "Projects | Evan Friedenberg"
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


flatten : Maybe (Maybe a) -> Maybe a
flatten ma =
    case ma of
        Just m ->
            m

        Nothing ->
            Nothing


toUriString : Github.Scalar.Uri -> String
toUriString (Github.Scalar.Uri uri) =
    uri


validateNonEmptyString : String -> Maybe String
validateNonEmptyString s =
    if String.isEmpty s then
        Nothing

    else
        Just s
