-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.RepositoryContactLink exposing (..)

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


{-| The contact link purpose.
-}
about : SelectionSet String Github.Object.RepositoryContactLink
about =
    Object.selectionForField "String" "about" [] Decode.string


{-| The contact link name.
-}
name : SelectionSet String Github.Object.RepositoryContactLink
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The contact link URL.
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Object.RepositoryContactLink
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)
