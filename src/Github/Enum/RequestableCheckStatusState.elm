-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.RequestableCheckStatusState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible states that can be requested when creating a check run.

  - Queued - The check suite or run has been queued.
  - InProgress - The check suite or run is in progress.
  - Completed - The check suite or run has been completed.
  - Waiting - The check suite or run is in waiting state.
  - Pending - The check suite or run is in pending state.

-}
type RequestableCheckStatusState
    = Queued
    | InProgress
    | Completed
    | Waiting
    | Pending


list : List RequestableCheckStatusState
list =
    [ Queued, InProgress, Completed, Waiting, Pending ]


decoder : Decoder RequestableCheckStatusState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "QUEUED" ->
                        Decode.succeed Queued

                    "IN_PROGRESS" ->
                        Decode.succeed InProgress

                    "COMPLETED" ->
                        Decode.succeed Completed

                    "WAITING" ->
                        Decode.succeed Waiting

                    "PENDING" ->
                        Decode.succeed Pending

                    _ ->
                        Decode.fail ("Invalid RequestableCheckStatusState type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : RequestableCheckStatusState -> String
toString enum____ =
    case enum____ of
        Queued ->
            "QUEUED"

        InProgress ->
            "IN_PROGRESS"

        Completed ->
            "COMPLETED"

        Waiting ->
            "WAITING"

        Pending ->
            "PENDING"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe RequestableCheckStatusState
fromString enumString____ =
    case enumString____ of
        "QUEUED" ->
            Just Queued

        "IN_PROGRESS" ->
            Just InProgress

        "COMPLETED" ->
            Just Completed

        "WAITING" ->
            Just Waiting

        "PENDING" ->
            Just Pending

        _ ->
            Nothing