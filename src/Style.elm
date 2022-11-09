module Style exposing (hexStringToColor, link, primary, secondary, white)

import Element exposing (Color, rgb255)
import Hex
import HexColor exposing (HexColor)


hexStringToColor : HexColor -> Maybe Color
hexStringToColor (HexColor.HexColor hex) =
    case String.toList hex of
        r1 :: r2 :: g1 :: g2 :: b1 :: b2 :: [] ->
            let
                joinToHex : Char -> Char -> Maybe Int
                joinToHex a b =
                    String.fromList [ a, b ]
                        |> Hex.fromString
                        |> Result.toMaybe
            in
            Maybe.map3 rgb255
                (joinToHex r1 r2)
                (joinToHex g1 g2)
                (joinToHex b1 b2)

        r :: g :: b :: [] ->
            let
                toHex : Char -> Maybe Int
                toHex =
                    String.fromChar >> Hex.fromString >> Result.toMaybe
            in
            Maybe.map3 rgb255
                (toHex r)
                (toHex g)
                (toHex b)

        _ ->
            Nothing


primary : Color
primary =
    rgb255 38 70 83


secondary : Color
secondary =
    rgb255 231 111 81


link : Color
link =
    rgb255 0 125 152


white : Color
white =
    rgb255 255 255 255
