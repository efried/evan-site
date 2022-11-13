module Page.About exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Font as Font
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url as Url
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


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "evanfriedenberg.com"
        , image =
            { url = Url.fromPath (Path.join [ "images", "avatar.webp" ])
            , alt = "evan avatar"
            , dimensions = Just { width = 320, height = 320 }
            , mimeType = Just "image/webp"
            }
        , description = "About me"
        , locale = Nothing
        , title = "About"
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "About"
    , body =
        column [ centerX, paddingXY 0 32, width (fill |> maximum 800) ]
            [ column
                []
                [ el
                    [ Font.size Style.fontSizes.header1
                    , Font.bold
                    , Font.color Style.secondary
                    , paddingXY 0 32
                    ]
                    (text "Hey there 👋")
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
                        Url.fromPath (Path.join [ "files", "Evan_Friedenberg_Resume.pdf" ])
                            |> Url.toString
                    , label = el [ Font.underline ] (text "download my resume")
                    }
                ]
            ]
    }
