-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.ProjectV2Item exposing (..)

import Github.Enum.ProjectV2ItemType
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


{-| The content of the referenced draft issue, issue, or pull request
-}
content :
    SelectionSet decodesTo Github.Union.ProjectV2ItemContent
    -> SelectionSet (Maybe decodesTo) Github.Object.ProjectV2Item
content object____ =
    Object.selectionForCompositeField "content" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2Item
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The actor who created the item.
-}
creator :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.ProjectV2Item
creator object____ =
    Object.selectionForCompositeField "creator" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.ProjectV2Item
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


type alias FieldValueByNameRequiredArguments =
    { name : String }


{-| A specific field value given a field name

  - name - The name of the field to return the field value of

-}
fieldValueByName :
    FieldValueByNameRequiredArguments
    -> SelectionSet decodesTo Github.Union.ProjectV2ItemFieldValue
    -> SelectionSet (Maybe decodesTo) Github.Object.ProjectV2Item
fieldValueByName requiredArgs____ object____ =
    Object.selectionForCompositeField "fieldValueByName" [ Argument.required "name" requiredArgs____.name Encode.string ] object____ (Basics.identity >> Decode.nullable)


type alias FieldValuesOptionalArguments =
    { after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    , orderBy : OptionalArgument Github.InputObject.ProjectV2ItemFieldValueOrder
    }


{-| List of field values

  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.
  - orderBy - Ordering options for project v2 item field values returned from the connection

-}
fieldValues :
    (FieldValuesOptionalArguments -> FieldValuesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ProjectV2ItemFieldValueConnection
    -> SelectionSet decodesTo Github.Object.ProjectV2Item
fieldValues fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { after = Absent, before = Absent, first = Absent, last = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int, Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodeProjectV2ItemFieldValueOrder ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "fieldValues" optionalArgs____ object____ Basics.identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.ProjectV2Item
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Whether the item is archived.
-}
isArchived : SelectionSet Bool Github.Object.ProjectV2Item
isArchived =
    Object.selectionForField "Bool" "isArchived" [] Decode.bool


{-| The project that contains this item.
-}
project :
    SelectionSet decodesTo Github.Object.ProjectV2
    -> SelectionSet decodesTo Github.Object.ProjectV2Item
project object____ =
    Object.selectionForCompositeField "project" [] object____ Basics.identity


{-| The type of the item.
-}
type_ : SelectionSet Github.Enum.ProjectV2ItemType.ProjectV2ItemType Github.Object.ProjectV2Item
type_ =
    Object.selectionForField "Enum.ProjectV2ItemType.ProjectV2ItemType" "type" [] Github.Enum.ProjectV2ItemType.decoder


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.ProjectV2Item
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
