module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask
import Components exposing (picture)
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Attributes as Attr
import Icons
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
        , description = "A site about Evan Friedenberg and the things the things he is working on"
        , locale = Nothing
        , title = "Home | Evan Friedenberg"
        }
        |> Seo.website



---- VIEW ----


type alias ExternalContact =
    { source : String
    , username : String
    , url : Pages.Url.Url
    }


toExternalContact : ( String, String, String ) -> Maybe ExternalContact
toExternalContact ( source, username, url ) =
    ExternalContact source username (Pages.Url.external url) |> Just


externalContactInfo : List ( String, String, String )
externalContactInfo =
    [ ( "Github", "@efried", "https://github.com/efried" )
    , ( "LinkedIn", "evanfriedenberg", "https://www.linkedin.com/in/evanfriedenberg" )
    , ( "Medium", "@evan.friedenberg", "https://www.medium.com/@evan.friedenberg" )
    , ( "Goodreads", "evanfriedenberg", "https://www.goodreads.com/evanfriedenberg" )
    ]


viewExternalAccount : ExternalContact -> Element msg
viewExternalAccount { source, username, url } =
    row
        []
        [ text (source ++ ": ")
        , newTabLink
            [ Font.color Style.link ]
            { url = Pages.Url.toString url, label = text username }
        ]


mailButton : Element msg
mailButton =
    link
        [ Font.color Style.link
        , Region.description "send an email"
        ]
        { url = "mailto:evan.friedenberg@gmail.com"
        , label = Icons.mail
        }


viewExternalAccounts : List (Element msg)
viewExternalAccounts =
    text "You can find me on..."
        :: row
            []
            [ text "Email: "
            , mailButton
            ]
        :: (List.filterMap
                toExternalContact
                externalContactInfo
                |> List.map viewExternalAccount
           )


wideLayout : Element msg
wideLayout =
    row
        [ width fill
        , height fill
        , Element.htmlAttribute (Attr.class "responsive-desktop")
        ]
        [ column
            [ width (fillPortion 4)
            , paddingXY 0 100
            , spacing 16
            ]
            [ el
                [ centerX
                , Font.size Style.fontSizes.header1
                , Font.bold
                , Font.color Style.secondary
                ]
                (text "It's me, Evan!")
            , el [ centerX ]
                (el
                    [ Border.rounded 160
                    , clip
                    , Element.htmlAttribute (Attr.class "record")
                    , inFront
                        (image
                            [ width (px 320)
                            , height (px 320)
                            , Region.description "Record"
                            ]
                            { src = "images/record-lines.svg", description = "Record lines" }
                        )
                    ]
                    (picture
                        [ { imageType = "image/avif", srcset = "images/avatar.avif" } ]
                        { src = "images/avatar.webp", description = "Picture of Evan", width = 320, height = 320 }
                    )
                )
            ]
        , column
            [ width (fillPortion 2)
            , paddingXY 0 100
            , spacing 16
            ]
            viewExternalAccounts
        ]


narrowLayout : Element msg
narrowLayout =
    column
        [ Element.htmlAttribute (Attr.class "responsive-mobile")
        , width (fillPortion 4)
        , paddingXY 0 50
        , spacing 16
        ]
        [ el
            [ centerX, Font.size Style.fontSizes.header2, Font.bold, Font.color Style.secondary ]
            (text "It's me, Evan!")
        , el
            [ centerX ]
            (el
                [ Border.rounded 100, clip ]
                (picture
                    [ { imageType = "image/avif", srcset = "images/avatar.avif" } ]
                    { src = "images/avatar.webp", description = "Picture of Evan", width = 200, height = 200 }
                )
            )
        , column
            [ spacing 10
            , centerX
            ]
            viewExternalAccounts
        ]


view : App data action routeParams -> Shared.Model -> View (PagesMsg ())
view app shared =
    { title = "Home | Evan Friedenberg"
    , body =
        row [ width fill, height fill ] [ wideLayout, narrowLayout ]
    }
