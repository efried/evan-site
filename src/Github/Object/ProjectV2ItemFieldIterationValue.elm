-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ProjectV2ItemFieldIterationValue exposing (..)

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
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2ItemFieldIterationValue
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The actor who created the item.
-}
creator :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.ProjectV2ItemFieldIterationValue
creator object____ =
    Object.selectionForCompositeField "creator" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.ProjectV2ItemFieldIterationValue
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


{-| The duration of the iteration in days.
-}
duration : SelectionSet Int Github.Object.ProjectV2ItemFieldIterationValue
duration =
    Object.selectionForField "Int" "duration" [] Decode.int


{-| The project field that contains this value.
-}
field :
    SelectionSet decodesTo Github.Union.ProjectV2FieldConfiguration
    -> SelectionSet decodesTo Github.Object.ProjectV2ItemFieldIterationValue
field object____ =
    Object.selectionForCompositeField "field" [] object____ Basics.identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.ProjectV2ItemFieldIterationValue
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The project item that contains this value.
-}
item :
    SelectionSet decodesTo Github.Object.ProjectV2Item
    -> SelectionSet decodesTo Github.Object.ProjectV2ItemFieldIterationValue
item object____ =
    Object.selectionForCompositeField "item" [] object____ Basics.identity


{-| The ID of the iteration.
-}
iterationId : SelectionSet String Github.Object.ProjectV2ItemFieldIterationValue
iterationId =
    Object.selectionForField "String" "iterationId" [] Decode.string


{-| The start date of the iteration.
-}
startDate : SelectionSet Github.ScalarCodecs.Date Github.Object.ProjectV2ItemFieldIterationValue
startDate =
    Object.selectionForField "ScalarCodecs.Date" "startDate" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDate |> .decoder)


{-| The title of the iteration.
-}
title : SelectionSet String Github.Object.ProjectV2ItemFieldIterationValue
title =
    Object.selectionForField "String" "title" [] Decode.string


{-| The title of the iteration, with HTML.
-}
titleHTML : SelectionSet String Github.Object.ProjectV2ItemFieldIterationValue
titleHTML =
    Object.selectionForField "String" "titleHTML" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2ItemFieldIterationValue
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)