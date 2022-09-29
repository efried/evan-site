module Page.Projects exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.Http
import Element
import Element.Border as Border
import Element.Font as Font
import Head
import Head.Seo as Seo
import OptimizedDecoder
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Secrets as Secrets
import Pages.Url
import Path
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
    , forked : Bool
    , archived : Bool
    , htmlUrl : String
    }


type alias Data =
    List Project


data : DataSource Data
data =
    DataSource.Http.request
        (Secrets.succeed
            (\apiKey ->
                { url = "https://api.github.com/users/efried/repos?type=owner"
                , method = "GET"
                , headers = [ ( "Accept", "application/vnd.github+json" ), ( "Authorization", "token " ++ apiKey ) ]
                , body = DataSource.Http.emptyBody
                }
            )
            |> Secrets.with "API_KEY"
        )
        (OptimizedDecoder.list
            (OptimizedDecoder.map6
                Project
                (OptimizedDecoder.field "name" OptimizedDecoder.string)
                (OptimizedDecoder.field "description" (OptimizedDecoder.nullable OptimizedDecoder.string))
                (OptimizedDecoder.field "homepage" (OptimizedDecoder.nullable OptimizedDecoder.string))
                (OptimizedDecoder.field "fork" OptimizedDecoder.bool)
                (OptimizedDecoder.field "archived" OptimizedDecoder.bool)
                (OptimizedDecoder.field "html_url" OptimizedDecoder.string)
            )
        )
        |> DataSource.map
            (List.filter
                (\project ->
                    project.forked == False && project.archived == False
                )
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


validateNonEmptyString : String -> Maybe String
validateNonEmptyString s =
    if String.isEmpty s then
        Nothing

    else
        Just s


viewProject : Project -> Element.Element msg
viewProject project =
    Element.column
        [ Element.width (Element.fill |> Element.minimum 315)
        , Element.height (Element.px 200)
        , Element.padding 10
        , Border.solid
        , Border.width 2
        , Border.rounded 6
        , Element.mouseOver
            [ Border.shadow
                { blur = 1
                , size = 1
                , offset = ( 1, 1 )
                , color = Style.primary
                }
            , Element.moveUp 2
            , Element.moveLeft 2
            ]
        ]
        [ Element.row
            [ Font.size 24
            , Font.color Style.secondary
            , Element.width Element.fill
            , Element.spacingXY 0 10
            ]
            [ Element.text project.name
            ]
        , Element.column []
            [ Element.paragraph [ Element.paddingXY 0 10 ]
                [ Element.text
                    (case project.description of
                        Nothing ->
                            "No description."

                        Just description ->
                            description ++ "."
                    )
                ]
            , Element.newTabLink [ Font.bold, Font.underline, Font.color Style.link ]
                { url = project.htmlUrl
                , label = Element.text "View it on Github"
                }
            , case
                project.homepage
                    |> Maybe.andThen validateNonEmptyString
              of
                Nothing ->
                    Element.none

                Just homepage ->
                    Element.el [ Element.paddingXY 0 10 ]
                        (Element.newTabLink
                            [ Font.bold, Font.underline, Font.color Style.link, Element.spacingXY 0 15 ]
                            { url = homepage
                            , label = Element.text "Try it out!"
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
        Element.el
            []
            (Element.wrappedRow
                [ Element.spacing 10
                , Element.padding 20
                ]
                (List.map
                    viewProject
                    static.data
                )
            )
    }
