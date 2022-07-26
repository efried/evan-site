-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ProjectV2IterationField exposing (..)

import Github.Enum.ProjectV2FieldType
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


{-| Iteration configuration settings
-}
configuration :
    SelectionSet decodesTo Github.Object.ProjectV2IterationFieldConfiguration
    -> SelectionSet decodesTo Github.Object.ProjectV2IterationField
configuration object____ =
    Object.selectionForCompositeField "configuration" [] object____ Basics.identity


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2IterationField
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The field's type.
-}
dataType : SelectionSet Github.Enum.ProjectV2FieldType.ProjectV2FieldType Github.Object.ProjectV2IterationField
dataType =
    Object.selectionForField "Enum.ProjectV2FieldType.ProjectV2FieldType" "dataType" [] Github.Enum.ProjectV2FieldType.decoder


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.ProjectV2IterationField
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.ProjectV2IterationField
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The project field's name.
-}
name : SelectionSet String Github.Object.ProjectV2IterationField
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The project that contains this field.
-}
project :
    SelectionSet decodesTo Github.Object.ProjectV2
    -> SelectionSet decodesTo Github.Object.ProjectV2IterationField
project object____ =
    Object.selectionForCompositeField "project" [] object____ Basics.identity


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2IterationField
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
