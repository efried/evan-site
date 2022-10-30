-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ContributionCalendarWeek exposing (..)

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


{-| The days of contributions in this week.
-}
contributionDays :
    SelectionSet decodesTo Github.Object.ContributionCalendarDay
    -> SelectionSet (List decodesTo) Github.Object.ContributionCalendarWeek
contributionDays object____ =
    Object.selectionForCompositeField "contributionDays" [] object____ (Basics.identity >> Decode.list)


{-| The date of the earliest square in this week.
-}
firstDay : SelectionSet Github.ScalarCodecs.Date Github.Object.ContributionCalendarWeek
firstDay =
    Object.selectionForField "ScalarCodecs.Date" "firstDay" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDate |> .decoder)
