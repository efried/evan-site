-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.CreatedIssueContribution exposing (..)

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


{-| Whether this contribution is associated with a record you do not have access to. For
example, your own 'first issue' contribution may have been made on a repository you can no
longer access.
-}
isRestricted : SelectionSet Bool Github.Object.CreatedIssueContribution
isRestricted =
    Object.selectionForField "Bool" "isRestricted" [] Decode.bool


{-| The issue that was opened.
-}
issue :
    SelectionSet decodesTo Github.Object.Issue
    -> SelectionSet decodesTo Github.Object.CreatedIssueContribution
issue object____ =
    Object.selectionForCompositeField "issue" [] object____ Basics.identity


{-| When this contribution was made.
-}
occurredAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.CreatedIssueContribution
occurredAt =
    Object.selectionForField "ScalarCodecs.DateTime" "occurredAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP path for this contribution.
-}
resourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.CreatedIssueContribution
resourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The HTTP URL for this contribution.
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Object.CreatedIssueContribution
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The user who made this contribution.
-}
user :
    SelectionSet decodesTo Github.Object.User
    -> SelectionSet decodesTo Github.Object.CreatedIssueContribution
user object____ =
    Object.selectionForCompositeField "user" [] object____ Basics.identity
