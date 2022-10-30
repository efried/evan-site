-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.PatchStatus exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible types of patch statuses.

  - Added - The file was added. Git status 'A'.
  - Deleted - The file was deleted. Git status 'D'.
  - Renamed - The file was renamed. Git status 'R'.
  - Copied - The file was copied. Git status 'C'.
  - Modified - The file's contents were changed. Git status 'M'.
  - Changed - The file's type was changed. Git status 'T'.

-}
type PatchStatus
    = Added
    | Deleted
    | Renamed
    | Copied
    | Modified
    | Changed


list : List PatchStatus
list =
    [ Added, Deleted, Renamed, Copied, Modified, Changed ]


decoder : Decoder PatchStatus
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ADDED" ->
                        Decode.succeed Added

                    "DELETED" ->
                        Decode.succeed Deleted

                    "RENAMED" ->
                        Decode.succeed Renamed

                    "COPIED" ->
                        Decode.succeed Copied

                    "MODIFIED" ->
                        Decode.succeed Modified

                    "CHANGED" ->
                        Decode.succeed Changed

                    _ ->
                        Decode.fail ("Invalid PatchStatus type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : PatchStatus -> String
toString enum____ =
    case enum____ of
        Added ->
            "ADDED"

        Deleted ->
            "DELETED"

        Renamed ->
            "RENAMED"

        Copied ->
            "COPIED"

        Modified ->
            "MODIFIED"

        Changed ->
            "CHANGED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe PatchStatus
fromString enumString____ =
    case enumString____ of
        "ADDED" ->
            Just Added

        "DELETED" ->
            Just Deleted

        "RENAMED" ->
            Just Renamed

        "COPIED" ->
            Just Copied

        "MODIFIED" ->
            Just Modified

        "CHANGED" ->
            Just Changed

        _ ->
            Nothing