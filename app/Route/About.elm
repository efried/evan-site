module Route.About exposing (ActionData, Data, Model, Msg, route)

import Animation
import BackendTask
import Components exposing (animatedEl)
import Element exposing (..)
import Element.Font as Font
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import MimeType exposing (parseMimeType)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import Style
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias RouteParams =
    {}


type alias Data =
    ()


type alias ActionData =
    {}


type alias Msg =
    ()


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
    BackendTask.succeed () |> BackendTask.allowFatal


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



---- VIEW ----


view : App data action routeParams -> Shared.Model -> View (PagesMsg ())
view app shared =
    { title = "About | Evan Friedenberg"
    , body =
        column [ centerX, paddingXY 0 32, width (fill |> maximum 800) ]
            [ column
                []
                [ row
                    [ Font.size Style.fontSizes.header1
                    , Font.bold
                    , Font.color Style.secondary
                    , paddingXY 0 32
                    ]
                    [ text "Hey there "
                    , animatedEl Animation.wave [] (text "✋")
                    ]
                , column [ paddingXY 0 32, spacingXY 0 16 ]
                    [ paragraph []
                        [ text "You "
                        , el [ Font.italic ] (text "clearly")
                        , text " want to learn a little more about me."
                        ]
                    , paragraph [] [ text "I am a software developer with 6+ years at companies large and small." ]
                    , paragraph [] [ text "I love creating delightful experiences through code. I am especially interested in functional programming, API design, and testing." ]
                    ]
                ]
            , paragraph [ paddingXY 0 32 ] [ text "You can also find me working out 🏋️, drinking coffee ☕️, reading 📚, or watching reality TV 📺." ]
            , wrappedRow
                [ paddingXY 0 32 ]
                [ text "For all else "
                , download []
                    { url =
                        Pages.Url.fromPath (UrlPath.join [ "files", "Evan_Friedenberg_Resume.pdf" ])
                            |> Pages.Url.toString
                    , label = el [ Font.underline ] (text "download my resume")
                    }
                ]
            ]
    }
