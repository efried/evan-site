-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.EnterpriseRepositoryInfo exposing (..)

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


id : SelectionSet Github.ScalarCodecs.Id Github.Object.EnterpriseRepositoryInfo
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Identifies if the repository is private or internal.
-}
isPrivate : SelectionSet Bool Github.Object.EnterpriseRepositoryInfo
isPrivate =
    Object.selectionForField "Bool" "isPrivate" [] Decode.bool


{-| The repository's name.
-}
name : SelectionSet String Github.Object.EnterpriseRepositoryInfo
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The repository's name with owner.
-}
nameWithOwner : SelectionSet String Github.Object.EnterpriseRepositoryInfo
nameWithOwner =
    Object.selectionForField "String" "nameWithOwner" [] Decode.string
