-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.MigrationSourceType exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Represents the different Octoshift migration sources.

  - AzureDevops - An Azure DevOps migration source.
  - BitbucketServer - A Bitbucket Server migration source.
  - GithubArchive - A GitHub Migration API source.

-}
type MigrationSourceType
    = AzureDevops
    | BitbucketServer
    | GithubArchive


list : List MigrationSourceType
list =
    [ AzureDevops, BitbucketServer, GithubArchive ]


decoder : Decoder MigrationSourceType
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "AZURE_DEVOPS" ->
                        Decode.succeed AzureDevops

                    "BITBUCKET_SERVER" ->
                        Decode.succeed BitbucketServer

                    "GITHUB_ARCHIVE" ->
                        Decode.succeed GithubArchive

                    _ ->
                        Decode.fail ("Invalid MigrationSourceType type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : MigrationSourceType -> String
toString enum____ =
    case enum____ of
        AzureDevops ->
            "AZURE_DEVOPS"

        BitbucketServer ->
            "BITBUCKET_SERVER"

        GithubArchive ->
            "GITHUB_ARCHIVE"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe MigrationSourceType
fromString enumString____ =
    case enumString____ of
        "AZURE_DEVOPS" ->
            Just AzureDevops

        "BITBUCKET_SERVER" ->
            Just BitbucketServer

        "GITHUB_ARCHIVE" ->
            Just GithubArchive

        _ ->
            Nothing
