-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.RepositoryMigration exposing (..)

import Github.Enum.MigrationState
import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.ScalarCodecs
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| The Octoshift migration flag to continue on error.
-}
continueOnError : SelectionSet Bool Github.Object.RepositoryMigration
continueOnError =
    Object.selectionForField "Bool" "continueOnError" [] Decode.bool


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.RepositoryMigration
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe String) Github.Object.RepositoryMigration
databaseId =
    Object.selectionForField "(Maybe String)" "databaseId" [] (Decode.string |> Decode.nullable)


{-| The reason the migration failed.
-}
failureReason : SelectionSet (Maybe String) Github.Object.RepositoryMigration
failureReason =
    Object.selectionForField "(Maybe String)" "failureReason" [] (Decode.string |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.RepositoryMigration
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The URL for the migration log (expires 1 day after migration completes).
-}
migrationLogUrl : SelectionSet (Maybe Github.ScalarCodecs.Uri) Github.Object.RepositoryMigration
migrationLogUrl =
    Object.selectionForField "(Maybe ScalarCodecs.Uri)" "migrationLogUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder |> Decode.nullable)


{-| The Octoshift migration source.
-}
migrationSource :
    SelectionSet decodesTo Github.Object.MigrationSource
    -> SelectionSet decodesTo Github.Object.RepositoryMigration
migrationSource object____ =
    Object.selectionForCompositeField "migrationSource" [] object____ Basics.identity


{-| The target repository name.
-}
repositoryName : SelectionSet String Github.Object.RepositoryMigration
repositoryName =
    Object.selectionForField "String" "repositoryName" [] Decode.string


{-| The Octoshift migration source URL.
-}
sourceUrl : SelectionSet Github.ScalarCodecs.Uri Github.Object.RepositoryMigration
sourceUrl =
    Object.selectionForField "ScalarCodecs.Uri" "sourceUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The Octoshift migration state.
-}
state : SelectionSet Github.Enum.MigrationState.MigrationState Github.Object.RepositoryMigration
state =
    Object.selectionForField "Enum.MigrationState.MigrationState" "state" [] Github.Enum.MigrationState.decoder
