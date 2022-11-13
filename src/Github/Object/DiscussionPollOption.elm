-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.DiscussionPollOption exposing (..)

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


id : SelectionSet Github.ScalarCodecs.Id Github.Object.DiscussionPollOption
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The text for this option.
-}
option : SelectionSet String Github.Object.DiscussionPollOption
option =
    Object.selectionForField "String" "option" [] Decode.string


{-| The discussion poll that this option belongs to.
-}
poll :
    SelectionSet decodesTo Github.Object.DiscussionPoll
    -> SelectionSet (Maybe decodesTo) Github.Object.DiscussionPollOption
poll object____ =
    Object.selectionForCompositeField "poll" [] object____ (Basics.identity >> Decode.nullable)


{-| The total number of votes that have been cast for this option.
-}
totalVoteCount : SelectionSet Int Github.Object.DiscussionPollOption
totalVoteCount =
    Object.selectionForField "Int" "totalVoteCount" [] Decode.int


{-| Indicates if the viewer has voted for this option in the poll.
-}
viewerHasVoted : SelectionSet Bool Github.Object.DiscussionPollOption
viewerHasVoted =
    Object.selectionForField "Bool" "viewerHasVoted" [] Decode.bool
