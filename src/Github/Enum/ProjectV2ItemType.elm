-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.ProjectV2ItemType exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The type of a project item.

  - Issue - Issue
  - PullRequest - Pull Request
  - DraftIssue - Draft Issue
  - Redacted - Redacted Item

-}
type ProjectV2ItemType
    = Issue
    | PullRequest
    | DraftIssue
    | Redacted


list : List ProjectV2ItemType
list =
    [ Issue, PullRequest, DraftIssue, Redacted ]


decoder : Decoder ProjectV2ItemType
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ISSUE" ->
                        Decode.succeed Issue

                    "PULL_REQUEST" ->
                        Decode.succeed PullRequest

                    "DRAFT_ISSUE" ->
                        Decode.succeed DraftIssue

                    "REDACTED" ->
                        Decode.succeed Redacted

                    _ ->
                        Decode.fail ("Invalid ProjectV2ItemType type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : ProjectV2ItemType -> String
toString enum____ =
    case enum____ of
        Issue ->
            "ISSUE"

        PullRequest ->
            "PULL_REQUEST"

        DraftIssue ->
            "DRAFT_ISSUE"

        Redacted ->
            "REDACTED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe ProjectV2ItemType
fromString enumString____ =
    case enumString____ of
        "ISSUE" ->
            Just Issue

        "PULL_REQUEST" ->
            Just PullRequest

        "DRAFT_ISSUE" ->
            Just DraftIssue

        "REDACTED" ->
            Just Redacted

        _ ->
            Nothing
