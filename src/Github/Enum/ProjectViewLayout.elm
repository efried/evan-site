-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.ProjectViewLayout exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The layout of a project view.

  - BoardLayout - Board layout
  - TableLayout - Table layout

-}
type ProjectViewLayout
    = BoardLayout
    | TableLayout


list : List ProjectViewLayout
list =
    [ BoardLayout, TableLayout ]


decoder : Decoder ProjectViewLayout
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "BOARD_LAYOUT" ->
                        Decode.succeed BoardLayout

                    "TABLE_LAYOUT" ->
                        Decode.succeed TableLayout

                    _ ->
                        Decode.fail ("Invalid ProjectViewLayout type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : ProjectViewLayout -> String
toString enum____ =
    case enum____ of
        BoardLayout ->
            "BOARD_LAYOUT"

        TableLayout ->
            "TABLE_LAYOUT"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe ProjectViewLayout
fromString enumString____ =
    case enumString____ of
        "BOARD_LAYOUT" ->
            Just BoardLayout

        "TABLE_LAYOUT" ->
            Just TableLayout

        _ ->
            Nothing
