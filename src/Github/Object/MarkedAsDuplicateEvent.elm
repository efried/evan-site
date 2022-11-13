-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.MarkedAsDuplicateEvent exposing (..)

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


{-| Identifies the actor who performed the event.
-}
actor :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.MarkedAsDuplicateEvent
actor object____ =
    Object.selectionForCompositeField "actor" [] object____ (Basics.identity >> Decode.nullable)


{-| The authoritative issue or pull request which has been duplicated by another.
-}
canonical :
    SelectionSet decodesTo Github.Union.IssueOrPullRequest
    -> SelectionSet (Maybe decodesTo) Github.Object.MarkedAsDuplicateEvent
canonical object____ =
    Object.selectionForCompositeField "canonical" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.MarkedAsDuplicateEvent
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The issue or pull request which has been marked as a duplicate of another.
-}
duplicate :
    SelectionSet decodesTo Github.Union.IssueOrPullRequest
    -> SelectionSet (Maybe decodesTo) Github.Object.MarkedAsDuplicateEvent
duplicate object____ =
    Object.selectionForCompositeField "duplicate" [] object____ (Basics.identity >> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.MarkedAsDuplicateEvent
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Canonical and duplicate belong to different repositories.
-}
isCrossRepository : SelectionSet Bool Github.Object.MarkedAsDuplicateEvent
isCrossRepository =
    Object.selectionForField "Bool" "isCrossRepository" [] Decode.bool
