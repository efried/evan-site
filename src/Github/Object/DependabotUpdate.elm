-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.DependabotUpdate exposing (..)

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


{-| The error from a dependency update
-}
error :
    SelectionSet decodesTo Github.Object.DependabotUpdateError
    -> SelectionSet (Maybe decodesTo) Github.Object.DependabotUpdate
error object____ =
    Object.selectionForCompositeField "error" [] object____ (Basics.identity >> Decode.nullable)


{-| The associated pull request
-}
pullRequest :
    SelectionSet decodesTo Github.Object.PullRequest
    -> SelectionSet (Maybe decodesTo) Github.Object.DependabotUpdate
pullRequest object____ =
    Object.selectionForCompositeField "pullRequest" [] object____ (Basics.identity >> Decode.nullable)


{-| The repository associated with this node.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet decodesTo Github.Object.DependabotUpdate
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ Basics.identity
