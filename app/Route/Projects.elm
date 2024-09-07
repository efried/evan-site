module Route.Projects exposing (ActionData, Data, Model, Msg, route)

import BackendTask
import BackendTask.Env
import BackendTask.File
import BackendTask.Http
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import HexColor
import Json.Decode as Decode exposing (Decoder, field, list, nullable, string)
import Json.Encode
import MimeType exposing (parseMimeType)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Style exposing (hexStringToColor)
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias RouteParams =
    {}


type alias Data =
    List Project


type alias ActionData =
    {}


type alias Msg =
    ()


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Evan Friedenberg"
        , image =
            { url = [ "images", "avatar.webp" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "logo"
            , dimensions = Just { width = 320, height = 320 }
            , mimeType = parseMimeType "image/webp"
            }
        , description = "About me"
        , locale = Nothing
        , title = "About | Evan Friedenberg"
        }
        |> Seo.website


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState
            { view = view }


data : BackendTask.BackendTask FatalError Data
data =
    BackendTask.map2 Tuple.pair
        (BackendTask.Env.expect "API_KEY" |> BackendTask.allowFatal)
        (BackendTask.File.rawFile "Repos.graphql" |> BackendTask.allowFatal)
        |> BackendTask.andThen
            (\( apiKey, query ) ->
                BackendTask.Http.request
                    { url = "https://api.github.com/graphql"
                    , method = "POST"
                    , headers = [ ( "Authorization", "Bearer " ++ apiKey ) ]
                    , body =
                        BackendTask.Http.jsonBody
                            (Json.Encode.object [ ( "query", Json.Encode.string query ) ])
                    , retries = Just 1
                    , timeoutInMs = Just 30000
                    }
                    (BackendTask.Http.expectJson
                        projectsDecoder
                    )
                    |> BackendTask.allowFatal
            )


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


colorDecoder : Decoder (Maybe Color)
colorDecoder =
    Decode.map
        (\s ->
            String.toLower s
                |> HexColor.fromString
                |> Maybe.map hexStringToColor
                |> flatten
        )
        string


languageDecoder : Decoder Language
languageDecoder =
    Decode.map2 Language
        (field "name" string)
        (field "color" colorDecoder)


projectDecoder : Decoder Project
projectDecoder =
    Decode.map5 Project
        (field "name" string)
        (field "description" (nullable string))
        (field "homepageUrl" (nullable string))
        (field "url" string)
        (field "languages" (field "nodes" (list languageDecoder)))


projectsDecoder : Decoder (List Project)
projectsDecoder =
    field "data" (field "user" (field "repositories" (field "nodes" (list projectDecoder))))



---- VIEW ----


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


view : App Data action routeParams -> Shared.Model -> View (PagesMsg ())
view app shared =
    { title = "Evan Friedenberg | Home"
    , body =
        el
            []
            (wrappedRow
                [ spacing 10
                , padding 20
                ]
                (List.map
                    viewProject
                    app.data
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


validateNonEmptyString : String -> Maybe String
validateNonEmptyString s =
    if String.isEmpty s then
        Nothing

    else
        Just s
