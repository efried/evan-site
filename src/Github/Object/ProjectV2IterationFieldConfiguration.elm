-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ProjectV2IterationFieldConfiguration exposing (..)

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


{-| The iteration's completed iterations
-}
completedIterations :
    SelectionSet decodesTo Github.Object.ProjectV2IterationFieldIteration
    -> SelectionSet (List decodesTo) Github.Object.ProjectV2IterationFieldConfiguration
completedIterations object____ =
    Object.selectionForCompositeField "completedIterations" [] object____ (Basics.identity >> Decode.list)


{-| The iteration's duration in days
-}
duration : SelectionSet Int Github.Object.ProjectV2IterationFieldConfiguration
duration =
    Object.selectionForField "Int" "duration" [] Decode.int


{-| The iteration's iterations
-}
iterations :
    SelectionSet decodesTo Github.Object.ProjectV2IterationFieldIteration
    -> SelectionSet (List decodesTo) Github.Object.ProjectV2IterationFieldConfiguration
iterations object____ =
    Object.selectionForCompositeField "iterations" [] object____ (Basics.identity >> Decode.list)


{-| The iteration's start day of the week
-}
startDay : SelectionSet Int Github.Object.ProjectV2IterationFieldConfiguration
startDay =
    Object.selectionForField "Int" "startDay" [] Decode.int