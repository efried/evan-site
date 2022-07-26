-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.IssueStateReason exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible state reasons of an issue.

  - Reopened - An issue that has been reopened
  - NotPlanned - An issue that has been closed as not planned
  - Completed - An issue that has been closed as completed

-}
type IssueStateReason
    = Reopened
    | NotPlanned
    | Completed


list : List IssueStateReason
list =
    [ Reopened, NotPlanned, Completed ]


decoder : Decoder IssueStateReason
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "REOPENED" ->
                        Decode.succeed Reopened

                    "NOT_PLANNED" ->
                        Decode.succeed NotPlanned

                    "COMPLETED" ->
                        Decode.succeed Completed

                    _ ->
                        Decode.fail ("Invalid IssueStateReason type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : IssueStateReason -> String
toString enum____ =
    case enum____ of
        Reopened ->
            "REOPENED"

        NotPlanned ->
            "NOT_PLANNED"

        Completed ->
            "COMPLETED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe IssueStateReason
fromString enumString____ =
    case enumString____ of
        "REOPENED" ->
            Just Reopened

        "NOT_PLANNED" ->
            Just NotPlanned

        "COMPLETED" ->
            Just Completed

        _ ->
            Nothing
