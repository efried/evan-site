module HexColor exposing (HexColor(..), fromString)

import Parser exposing ((|.), (|=), Parser, chompWhile, end, getChompedString, run, succeed, symbol)


type HexColor
    = HexColor String


hexStringParser : Parser HexColor
hexStringParser =
    succeed HexColor
        |. symbol "#"
        |= getChompedString (chompWhile Char.isHexDigit)
        |. end


validateLength : HexColor -> Maybe HexColor
validateLength (HexColor s) =
    if String.length s == 6 || String.length s == 3 then
        Just (HexColor s)

    else
        Nothing


fromString : String -> Maybe HexColor
fromString s =
    run hexStringParser s
        |> Result.toMaybe
        |> Maybe.andThen validateLength
