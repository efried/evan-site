-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.IssueClosedStateReason exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible state reasons of a closed issue.

  - Completed - An issue that has been closed as completed
  - NotPlanned - An issue that has been closed as not planned

-}
type IssueClosedStateReason
    = Completed
    | NotPlanned


list : List IssueClosedStateReason
list =
    [ Completed, NotPlanned ]


decoder : Decoder IssueClosedStateReason
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "COMPLETED" ->
                        Decode.succeed Completed

                    "NOT_PLANNED" ->
                        Decode.succeed NotPlanned

                    _ ->
                        Decode.fail ("Invalid IssueClosedStateReason type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : IssueClosedStateReason -> String
toString enum____ =
    case enum____ of
        Completed ->
            "COMPLETED"

        NotPlanned ->
            "NOT_PLANNED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe IssueClosedStateReason
fromString enumString____ =
    case enumString____ of
        "COMPLETED" ->
            Just Completed

        "NOT_PLANNED" ->
            Just NotPlanned

        _ ->
            Nothing
