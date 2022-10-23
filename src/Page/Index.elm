module Page.Index exposing (Data, Model, Msg, page)

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
import Icons
import Page exposing (PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path
import Shared
import Simple.Animation as Animation
import Simple.Animation.Property as P
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


spin : Animation.Animation
spin =
    Animation.fromTo
        { duration = 1818
        , options = [ Animation.loop, Animation.linear ]
        }
        [ P.rotate 0 ]
        [ P.rotate 360 ]


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


wideLayout : Spinner -> List (Element Msg)
wideLayout spinner =
    let
        animation =
            case spinner of
                Spinning ->
                    spin

                NotSpinning ->
                    Animation.empty
    in
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
        , animatedEl
            animation
            [ Events.onMouseEnter StartSpinning
            , Events.onMouseLeave StopSpinning
            , centerX
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
    -> Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel model static =
    { title = "Home"
    , body =
        let
            pageBody =
                case sharedModel.device.class of
                    BigDesktop ->
                        wideLayout model

                    Desktop ->
                        wideLayout model

                    _ ->
                        narrowLayout
        in
        row
            [ width fill
            , height fill
            ]
            pageBody
    }
