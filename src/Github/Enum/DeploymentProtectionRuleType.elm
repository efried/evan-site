-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.DeploymentProtectionRuleType exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible protection rule types.

  - RequiredReviewers - Required reviewers
  - WaitTimer - Wait timer

-}
type DeploymentProtectionRuleType
    = RequiredReviewers
    | WaitTimer


list : List DeploymentProtectionRuleType
list =
    [ RequiredReviewers, WaitTimer ]


decoder : Decoder DeploymentProtectionRuleType
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "REQUIRED_REVIEWERS" ->
                        Decode.succeed RequiredReviewers

                    "WAIT_TIMER" ->
                        Decode.succeed WaitTimer

                    _ ->
                        Decode.fail ("Invalid DeploymentProtectionRuleType type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : DeploymentProtectionRuleType -> String
toString enum____ =
    case enum____ of
        RequiredReviewers ->
            "REQUIRED_REVIEWERS"

        WaitTimer ->
            "WAIT_TIMER"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe DeploymentProtectionRuleType
fromString enumString____ =
    case enumString____ of
        "REQUIRED_REVIEWERS" ->
            Just RequiredReviewers

        "WAIT_TIMER" ->
            Just WaitTimer

        _ ->
            Nothing
