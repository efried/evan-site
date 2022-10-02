module Page.Index exposing (Data, Model, Msg, page)

import Components exposing (picture)
import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Head
import Head.Seo as Seo
import Icons
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path
import Shared
import Simple.Transition as Transition
import Style
import Url as ElmUrl
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
            { url = Pages.Url.fromPath (Path.join [ "images", "avatar.webp" ])
            , alt = "evan avatar"
            , dimensions = Just { width = 320, height = 320 }
            , mimeType = Just "image/webp"
            }
        , description = "A site about me and the things I work on"
        , locale = Nothing
        , title = "evanfriedenberg.com"
        }
        |> Seo.website


type alias Data =
    ()


type alias ExternalContact =
    { source : String
    , username : String
    , url : ElmUrl.Url
    }


toExternalContact : ( String, String, String ) -> Maybe ExternalContact
toExternalContact ( source, username, maybeUrl ) =
    Maybe.map
        (\url -> ExternalContact source username url)
        (ElmUrl.fromString maybeUrl)


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
        [ column
            []
            [ text (source ++ ": ") ]
        , column
            [ Font.color Style.link ]
            [ newTabLink
                []
                { url = ElmUrl.toString url, label = text username }
            ]
        ]


mailButton : Element msg
mailButton =
    link
        [ Region.description "send an email" ]
        { url = "mailto:evan.friedenberg@gmail.com"
        , label = Icons.mail
        }


viewExternalAccounts : List (Element msg)
viewExternalAccounts =
    text "You can find me on..."
        :: row
            []
            [ column
                []
                [ text "Email: " ]
            , column
                [ Font.color Style.link ]
                [ mailButton ]
            ]
        :: (List.filterMap
                toExternalContact
                externalContactInfo
                |> List.map viewExternalAccount
           )


wideLayout : List (Element msg)
wideLayout =
    [ column
        [ width (fillPortion 4)
        , paddingXY 0 100
        , spacing 16
        , centerX
        ]
        [ el
            [ centerX
            , Font.size 32
            , Font.bold
            , Font.color Style.secondary
            ]
            (text "It's me, Evan!")
        , el
            [ centerX
            , mouseOver
                [ rotate (turns 100)
                ]
            , Transition.properties
                [ Transition.transform 181818 [ Transition.linear ]
                ]
                |> htmlAttribute
            ]
            (el
                [ Border.rounded 160
                , clip
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


narrowLayout : List (Element msg)
narrowLayout =
    [ column
        [ width (fillPortion 4)
        , paddingXY 0 100
        , spacing 16
        , centerX
        ]
        (List.append
            [ el
                [ centerX, Font.size 32, Font.bold, Font.color Style.secondary ]
                (text "It's me, Evan!")
            , el
                [ centerX
                ]
                (el
                    [ Border.rounded 100, clip ]
                    (picture
                        [ { imageType = "image/avif", srcset = "images/avatar-small.avif" } ]
                        { src = "images/avatar-small.webp", description = "Picture of Evan", width = 200, height = 200 }
                    )
                )
            ]
            [ column
                [ centerX
                , spacing 10
                ]
                viewExternalAccounts
            ]
        )
    ]


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Home"
    , body =
        let
            pageBody =
                case sharedModel.device.class of
                    BigDesktop ->
                        wideLayout

                    Desktop ->
                        wideLayout

                    _ ->
                        narrowLayout
        in
        row
            [ width fill
            , height fill
            ]
            pageBody
    }
