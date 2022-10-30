-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ProjectV2ItemFieldNumberValue exposing (..)

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
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2ItemFieldNumberValue
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The actor who created the item.
-}
creator :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.ProjectV2ItemFieldNumberValue
creator object____ =
    Object.selectionForCompositeField "creator" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.ProjectV2ItemFieldNumberValue
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


{-| The project field that contains this value.
-}
field :
    SelectionSet decodesTo Github.Union.ProjectV2FieldConfiguration
    -> SelectionSet decodesTo Github.Object.ProjectV2ItemFieldNumberValue
field object____ =
    Object.selectionForCompositeField "field" [] object____ Basics.identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.ProjectV2ItemFieldNumberValue
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The project item that contains this value.
-}
item :
    SelectionSet decodesTo Github.Object.ProjectV2Item
    -> SelectionSet decodesTo Github.Object.ProjectV2ItemFieldNumberValue
item object____ =
    Object.selectionForCompositeField "item" [] object____ Basics.identity


{-| Number as a float(8)
-}
number : SelectionSet (Maybe Float) Github.Object.ProjectV2ItemFieldNumberValue
number =
    Object.selectionForField "(Maybe Float)" "number" [] (Decode.float |> Decode.nullable)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2ItemFieldNumberValue
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
