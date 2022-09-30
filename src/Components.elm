module Components exposing (picture)

import Element
import Html as Html exposing (Html)
import Html.Attributes exposing (alt, attribute, height, src, style, width)


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
