module Footer exposing (view)

import Element exposing (..)
import Element.Font as Font
import Style


view : Element msg
view =
    el
        [ width fill
        , height (px 25)
        , Font.center
        , Font.extraLight
        , Font.size Style.fontSizes.small
        ]
        (text "Built with ♡ in Elm with elm-pages")
