module Header exposing (..)

import Element
import Element.Border as Border
import Element.Font as Font
import Pages.Url as Url
import Path exposing (Path)


view : Path -> Element.Element msg
view currentPath =
    Element.row
        [ Element.width Element.fill
        , Element.paddingXY 20 20
        , Border.color (Element.rgb255 0 0 0)
        , Border.widthEach { bottom = 2, left = 0, right = 0, top = 0 }
        ]
        [ Element.el
            [ Element.alignLeft ]
            (Element.link
                []
                { url = "/", label = Element.text "Evan Friedenberg" }
            )
        , Element.column
            [ Element.alignRight ]
            [ Element.row
                [ Element.spacingXY 20 0 ]
                [ link currentPath "projects" "Projects"
                ]
            ]
        ]


link : Path -> String -> String -> Element.Element msg
link currentPath pathRoute label =
    let
        style : List (Element.Attribute msg)
        style =
            if Url.toString (Url.fromPath currentPath) == "/" ++ pathRoute then
                [ Font.underline ]

            else
                []
    in
    Element.link
        []
        { url = "/" ++ pathRoute
        , label = Element.el style (Element.text label)
        }
