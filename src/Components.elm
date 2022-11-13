module Components exposing (Source, animatedEl, picture)

import Element exposing (Element)
import Html exposing (Html)
import Html.Attributes exposing (alt, attribute, height, src, style, width)
import Simple.Animation exposing (Animation)
import Simple.Animation.Animated


type alias Source =
    { imageType : String
    , srcset : String
    }


source : Source -> Html msg
source { imageType, srcset } =
    Html.node "source"
        [ attribute "type" imageType
        , attribute "srcset" srcset
        ]
        []


picture : List Source -> { width : Int, height : Int, src : String, description : String } -> Element.Element msg
picture sources image =
    Html.node "picture"
        []
        (List.concat
            [ List.map source sources
            , [ Html.img
                    [ width image.width
                    , height image.height
                    , style "display" "block"
                    , src image.src
                    , alt image.description
                    ]
                    []
              ]
            ]
        )
        |> Element.html


animatedUi : (List (Element.Attribute msg) -> children -> Element msg) -> Animation -> List (Element.Attribute msg) -> children -> Element msg
animatedUi =
    Simple.Animation.Animated.ui
        { behindContent = Element.behindContent
        , htmlAttribute = Element.htmlAttribute
        , html = Element.html
        }


animatedEl : Animation -> List (Element.Attribute msg) -> Element msg -> Element msg
animatedEl =
    animatedUi Element.el
