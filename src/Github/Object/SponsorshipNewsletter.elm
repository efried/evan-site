-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.SponsorshipNewsletter exposing (..)

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


{-| The contents of the newsletter, the message the sponsorable wanted to give.
-}
body : SelectionSet String Github.Object.SponsorshipNewsletter
body =
    Object.selectionForField "String" "body" [] Decode.string


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.SponsorshipNewsletter
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.SponsorshipNewsletter
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Indicates if the newsletter has been made available to sponsors.
-}
isPublished : SelectionSet Bool Github.Object.SponsorshipNewsletter
isPublished =
    Object.selectionForField "Bool" "isPublished" [] Decode.bool


{-| The user or organization this newsletter is from.
-}
sponsorable :
    SelectionSet decodesTo Github.Interface.Sponsorable
    -> SelectionSet decodesTo Github.Object.SponsorshipNewsletter
sponsorable object____ =
    Object.selectionForCompositeField "sponsorable" [] object____ Basics.identity


{-| The subject of the newsletter, what it's about.
-}
subject : SelectionSet String Github.Object.SponsorshipNewsletter
subject =
    Object.selectionForField "String" "subject" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.SponsorshipNewsletter
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)