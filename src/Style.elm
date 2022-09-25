module Style exposing (..)

import Element exposing (Color, DeviceClass(..), Orientation(..))


primary : Color
primary =
    Element.rgb255 38 70 83


secondary : Color
secondary =
    Element.rgb255 231 111 81


link : Color
link =
    Element.rgb255 42 157 143


white : Color
white =
    Element.rgb255 255 255 255


wideView : Element.Device -> Bool
wideView device =
    case ( device.class, device.orientation ) of
        ( Phone, _ ) ->
            False

        ( Tablet, _ ) ->
            False

        ( Desktop, Portrait ) ->
            False

        ( Desktop, Landscape ) ->
            True

        ( BigDesktop, _ ) ->
            True
