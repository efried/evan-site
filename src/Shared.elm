module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import Browser.Navigation
import DataSource
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Header
import Html exposing (Html)
import Json.Decode exposing (Decoder, decodeValue, field, int, map2)
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import Style
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type Msg
    = OnPageChange
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMobileMenu : Bool
    , device : Device
    }


type alias Window =
    { width : Int
    , height : Int
    }


windowDecoder : Decoder Window
windowDecoder =
    map2 Window
        (field "width" int)
        (field "height" int)


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
    let
        device =
            case flags of
                Pages.Flags.BrowserFlags bflags ->
                    case decodeValue windowDecoder bflags of
                        Ok window ->
                            classifyDevice window

                        Err _ ->
                            { class = Phone, orientation = Portrait }

                Pages.Flags.PreRenderFlags ->
                    { class = Phone, orientation = Portrait }
    in
    ( { showMobileMenu = False
      , device = device
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | showMobileMenu = False }, Cmd.none )

        SharedMsg globalMsg ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


view :
    Data
    ->
        { path : Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { title = pageView.title
    , body =
        layout
            [ Background.color Style.white
            ]
            (column
                [ width fill
                , height fill
                ]
                [ Header.view page.path
                , el
                    [ width fill
                    , height fill
                    , padding 20
                    , Font.color Style.primary
                    ]
                    pageView.body
                ]
            )
    }
