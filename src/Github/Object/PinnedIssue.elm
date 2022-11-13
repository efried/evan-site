-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.PinnedIssue exposing (..)

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


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.PinnedIssue
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.PinnedIssue
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The issue that was pinned.
-}
issue :
    SelectionSet decodesTo Github.Object.Issue
    -> SelectionSet decodesTo Github.Object.PinnedIssue
issue object____ =
    Object.selectionForCompositeField "issue" [] object____ Basics.identity


{-| The actor that pinned this issue.
-}
pinnedBy :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet decodesTo Github.Object.PinnedIssue
pinnedBy object____ =
    Object.selectionForCompositeField "pinnedBy" [] object____ Basics.identity


{-| The repository that this issue was pinned to.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet decodesTo Github.Object.PinnedIssue
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ Basics.identity
