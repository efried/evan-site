-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.TeamDiscussionCommentOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Properties by which team discussion comment connections can be ordered.

  - Number - Allows sequential ordering of team discussion comments (which is equivalent to chronological ordering).

-}
type TeamDiscussionCommentOrderField
    = Number


list : List TeamDiscussionCommentOrderField
list =
    [ Number ]


decoder : Decoder TeamDiscussionCommentOrderField
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "NUMBER" ->
                        Decode.succeed Number

                    _ ->
                        Decode.fail ("Invalid TeamDiscussionCommentOrderField type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : TeamDiscussionCommentOrderField -> String
toString enum____ =
    case enum____ of
        Number ->
            "NUMBER"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe TeamDiscussionCommentOrderField
fromString enumString____ =
    case enumString____ of
        "NUMBER" ->
            Just Number

        _ ->
            Nothing
