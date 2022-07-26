-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.DiscussionCategory exposing (..)

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
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.DiscussionCategory
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| A description of this category.
-}
description : SelectionSet (Maybe String) Github.Object.DiscussionCategory
description =
    Object.selectionForField "(Maybe String)" "description" [] (Decode.string |> Decode.nullable)


{-| An emoji representing this category.
-}
emoji : SelectionSet String Github.Object.DiscussionCategory
emoji =
    Object.selectionForField "String" "emoji" [] Decode.string


{-| This category's emoji rendered as HTML.
-}
emojiHTML : SelectionSet Github.ScalarCodecs.Html Github.Object.DiscussionCategory
emojiHTML =
    Object.selectionForField "ScalarCodecs.Html" "emojiHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.DiscussionCategory
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Whether or not discussions in this category support choosing an answer with the markDiscussionCommentAsAnswer mutation.
-}
isAnswerable : SelectionSet Bool Github.Object.DiscussionCategory
isAnswerable =
    Object.selectionForField "Bool" "isAnswerable" [] Decode.bool


{-| The name of this category.
-}
name : SelectionSet String Github.Object.DiscussionCategory
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The repository associated with this node.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet decodesTo Github.Object.DiscussionCategory
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ Basics.identity


{-| The slug of this category.
-}
slug : SelectionSet String Github.Object.DiscussionCategory
slug =
    Object.selectionForField "String" "slug" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.DiscussionCategory
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
