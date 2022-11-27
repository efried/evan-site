module Footer exposing (view)

import Element exposing (..)
import Element.Font as Font
import Style


view : Element msg
view =
    paragraph
        [ width fill
        , height (px 40)
        , Font.center
        , Font.extraLight
        , Font.size Style.fontSizes.small
        ]
        [ text "Built with ♡ in "
        , newTabLink [] { url = "https://elm-lang.org", label = el [ Font.underline ] (text "Elm") }
        , text " with "
        , newTabLink [] { url = "https://elm-pages.com", label = el [ Font.underline ] (text "elm-pages") }
        ]
