-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.TeamDiscussionOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Properties by which team discussion connections can be ordered.

  - CreatedAt - Allows chronological ordering of team discussions.

-}
type TeamDiscussionOrderField
    = CreatedAt


list : List TeamDiscussionOrderField
list =
    [ CreatedAt ]


decoder : Decoder TeamDiscussionOrderField
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "CREATED_AT" ->
                        Decode.succeed CreatedAt

                    _ ->
                        Decode.fail ("Invalid TeamDiscussionOrderField type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : TeamDiscussionOrderField -> String
toString enum____ =
    case enum____ of
        CreatedAt ->
            "CREATED_AT"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe TeamDiscussionOrderField
fromString enumString____ =
    case enumString____ of
        "CREATED_AT" ->
            Just CreatedAt

        _ ->
            Nothing
