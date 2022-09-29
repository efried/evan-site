module Header exposing (..)

import Element
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Pages.Url as Url
import Path exposing (Path)
import Style


view : Path -> Element.Element msg
view currentPath =
    Element.row
        [ Element.width Element.fill
        , Element.height (Element.px 60)
        , Element.paddingXY 20 10
        , Element.spacingXY 20 0
        , Border.color Style.primary
        , Border.widthEach { bottom = 2, left = 0, right = 0, top = 0 }
        , Font.color Style.primary
        ]
        [ if String.isEmpty (Path.toRelative currentPath) then
            Element.none

          else
            Element.el
                []
                (Element.link
                    []
                    { url = "/"
                    , label =
                        Element.image
                            [ Element.width (Element.px 40)
                            , Element.height (Element.px 40)
                            , Region.description "Home"
                            ]
                            { src = "images/avatar-small.webp", description = "Picture of Evan" }
                    }
                )
        , Element.el
            [ Element.alignRight ]
            (link currentPath "projects" "Projects")
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
