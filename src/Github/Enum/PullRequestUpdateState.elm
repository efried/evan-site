-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.PullRequestUpdateState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible target states when updating a pull request.

  - Open - A pull request that is still open.
  - Closed - A pull request that has been closed without being merged.

-}
type PullRequestUpdateState
    = Open
    | Closed


list : List PullRequestUpdateState
list =
    [ Open, Closed ]


decoder : Decoder PullRequestUpdateState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OPEN" ->
                        Decode.succeed Open

                    "CLOSED" ->
                        Decode.succeed Closed

                    _ ->
                        Decode.fail ("Invalid PullRequestUpdateState type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : PullRequestUpdateState -> String
toString enum____ =
    case enum____ of
        Open ->
            "OPEN"

        Closed ->
            "CLOSED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe PullRequestUpdateState
fromString enumString____ =
    case enumString____ of
        "OPEN" ->
            Just Open

        "CLOSED" ->
            Just Closed

        _ ->
            Nothing