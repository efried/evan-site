-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.PermissionSource exposing (..)

import Github.Enum.DefaultRepositoryPermissionField
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


{-| The organization the repository belongs to.
-}
organization :
    SelectionSet decodesTo Github.Object.Organization
    -> SelectionSet decodesTo Github.Object.PermissionSource
organization object____ =
    Object.selectionForCompositeField "organization" [] object____ Basics.identity


{-| The level of access this source has granted to the user.
-}
permission : SelectionSet Github.Enum.DefaultRepositoryPermissionField.DefaultRepositoryPermissionField Github.Object.PermissionSource
permission =
    Object.selectionForField "Enum.DefaultRepositoryPermissionField.DefaultRepositoryPermissionField" "permission" [] Github.Enum.DefaultRepositoryPermissionField.decoder


{-| The source of this permission.
-}
source :
    SelectionSet decodesTo Github.Union.PermissionGranter
    -> SelectionSet decodesTo Github.Object.PermissionSource
source object____ =
    Object.selectionForCompositeField "source" [] object____ Basics.identity