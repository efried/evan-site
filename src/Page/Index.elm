module Page.Index exposing (Data, Model, Msg, RouteParams, page)

import Animation
import Browser.Navigation
import Components exposing (animatedEl, picture)
import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Region as Region
import Head
import Head.Seo as Seo
import Html.Attributes as Attr
import Icons
import Page exposing (PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path
import Shared
import Style
import Url as ElmUrl
import View exposing (View)



---- PROGRAM ----


type alias RouteParams =
    {}


page : PageWithState RouteParams Data Model Msg
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildWithLocalState
            { init = init
            , subscriptions = subscriptions
            , update = update
            , view = view
            }


data : DataSource Data
data =
    DataSource.succeed ()


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
        , description = "A site about Evan Friedenberg and the things the things he is working on"
        , locale = Nothing
        , title = "Evan Friedenberg"
        }
        |> Seo.website


type alias Data =
    ()



---- MODEL ----


type Spinner
    = Spinning
    | NotSpinning


type alias Model =
    Spinner


init :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> ( Model, Cmd Msg )
init maybeUrl sharedModel static =
    ( NotSpinning, Cmd.none )



---- SUBSCRIPTIONS ----


subscriptions :
    Maybe PageUrl
    -> RouteParams
    -> Path.Path
    -> Model
    -> Sub Msg
subscriptions maybeUrl routeParams path templateModel =
    Sub.none



---- UPDATE ----


type Msg
    = StartSpinning
    | StopSpinning


update :
    PageUrl
    -> Maybe Browser.Navigation.Key
    -> Shared.Model
    -> StaticPayload templateData routeParams
    -> Msg
    -> Model
    -> ( Model, Cmd Msg )
update url maybeKey sharedModel static templateMsg templateModel =
    case templateMsg of
        StartSpinning ->
            ( Spinning, Cmd.none )

        StopSpinning ->
            ( NotSpinning, Cmd.none )



---- VIEW ----


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
        [ text (source ++ ": ")
        , newTabLink
            [ Font.color Style.link ]
            { url = ElmUrl.toString url, label = text username }
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


wideLayout : Spinner -> Element Msg
wideLayout spinner =
    let
        animation =
            case spinner of
                Spinning ->
                    Animation.spin

                NotSpinning ->
                    Animation.empty

        recordImage =
            case spinner of
                Spinning ->
                    image
                        [ width (px 320)
                        , height (px 320)
                        , Region.description "Record"
                        ]
                        { src = "images/record-lines.svg", description = "Record lines" }

                NotSpinning ->
                    Element.none
    in
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
            , animatedEl
                animation
                [ Events.onMouseEnter StartSpinning
                , Events.onMouseLeave StopSpinning
                , centerX
                ]
                (el
                    [ Border.rounded 160
                    , clip
                    , inFront recordImage
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


view :
    Maybe PageUrl
    -> Shared.Model
    -> Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel model static =
    { title = "Evan Friedenberg | Home"
    , body =
        row
            [ width fill
            , height fill
            ]
            [ wideLayout model, narrowLayout ]
    }
