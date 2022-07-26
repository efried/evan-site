module Header exposing (view)

import Element exposing (..)
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Pages.Url as Url
import Path exposing (Path)
import Style


view : Path -> Element msg
view currentPath =
    row
        [ width fill
        , height (px 60)
        , paddingXY 20 10
        , spacingXY 20 0
        , Border.color Style.primary
        , Border.widthEach { bottom = 2, left = 0, right = 0, top = 0 }
        ]
        (List.append
            [ if String.isEmpty (Path.toRelative currentPath) then
                none

              else
                el
                    []
                    (Element.link
                        []
                        { url = "/"
                        , label =
                            image
                                [ width (px 40)
                                , height (px 40)
                                , Region.description "Home"
                                ]
                                { src =
                                    Url.fromPath (Path.join [ "images", "avatar-small.webp" ])
                                        |> Url.toString
                                , description = "Picture of Evan"
                                }
                        }
                    )
            ]
            (List.map
                (el [ alignRight ])
                [ link currentPath "projects" "Projects"
                , link currentPath "about" "About"
                ]
                |> List.intersperse (text "/")
            )
        )


link : Path -> String -> String -> Element msg
link currentPath pathRoute label =
    let
        style : List (Attribute msg)
        style =
            if Url.toString (Url.fromPath currentPath) == "/" ++ pathRoute then
                [ Font.underline ]

            else
                []
    in
    Element.link
        []
        { url = "/" ++ pathRoute
        , label = el style (text label)
        }
