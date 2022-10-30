-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.PinnedDiscussion exposing (..)

import Github.Enum.PinnedDiscussionGradient
import Github.Enum.PinnedDiscussionPattern
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


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.PinnedDiscussion
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.PinnedDiscussion
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


{-| The discussion that was pinned.
-}
discussion :
    SelectionSet decodesTo Github.Object.Discussion
    -> SelectionSet decodesTo Github.Object.PinnedDiscussion
discussion object____ =
    Object.selectionForCompositeField "discussion" [] object____ Basics.identity


{-| Color stops of the chosen gradient
-}
gradientStopColors : SelectionSet (List String) Github.Object.PinnedDiscussion
gradientStopColors =
    Object.selectionForField "(List String)" "gradientStopColors" [] (Decode.string |> Decode.list)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.PinnedDiscussion
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Background texture pattern
-}
pattern : SelectionSet Github.Enum.PinnedDiscussionPattern.PinnedDiscussionPattern Github.Object.PinnedDiscussion
pattern =
    Object.selectionForField "Enum.PinnedDiscussionPattern.PinnedDiscussionPattern" "pattern" [] Github.Enum.PinnedDiscussionPattern.decoder


{-| The actor that pinned this discussion.
-}
pinnedBy :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet decodesTo Github.Object.PinnedDiscussion
pinnedBy object____ =
    Object.selectionForCompositeField "pinnedBy" [] object____ Basics.identity


{-| Preconfigured background gradient option
-}
preconfiguredGradient : SelectionSet (Maybe Github.Enum.PinnedDiscussionGradient.PinnedDiscussionGradient) Github.Object.PinnedDiscussion
preconfiguredGradient =
    Object.selectionForField "(Maybe Enum.PinnedDiscussionGradient.PinnedDiscussionGradient)" "preconfiguredGradient" [] (Github.Enum.PinnedDiscussionGradient.decoder |> Decode.nullable)


{-| The repository associated with this node.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet decodesTo Github.Object.PinnedDiscussion
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ Basics.identity


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.PinnedDiscussion
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
