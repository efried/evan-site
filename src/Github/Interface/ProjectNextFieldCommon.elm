-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.ProjectNextFieldCommon exposing (..)

import Github.Enum.ProjectNextFieldType
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
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


type alias Fragments decodesTo =
    { onProjectNextField : SelectionSet decodesTo Github.Object.ProjectNextField
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.ProjectNextFieldCommon
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [ Object.buildFragment "ProjectNextField" selections____.onProjectNextField
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onProjectNextField = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| Identifies the date and time when the object was created.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Interface.ProjectNextFieldCommon
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The field's type.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
dataType : SelectionSet Github.Enum.ProjectNextFieldType.ProjectNextFieldType Github.Interface.ProjectNextFieldCommon
dataType =
    Object.selectionForField "Enum.ProjectNextFieldType.ProjectNextFieldType" "dataType" [] Github.Enum.ProjectNextFieldType.decoder


{-| Identifies the primary key from the database.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
databaseId : SelectionSet (Maybe Int) Github.Interface.ProjectNextFieldCommon
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Interface.ProjectNextFieldCommon
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The project field's name.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
name : SelectionSet String Github.Interface.ProjectNextFieldCommon
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The project that contains this field.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
project :
    SelectionSet decodesTo Github.Object.ProjectNext
    -> SelectionSet decodesTo Github.Interface.ProjectNextFieldCommon
project object____ =
    Object.selectionForCompositeField "project" [] object____ Basics.identity


{-| The field's settings.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
settings : SelectionSet (Maybe String) Github.Interface.ProjectNextFieldCommon
settings =
    Object.selectionForField "(Maybe String)" "settings" [] (Decode.string |> Decode.nullable)


{-| Identifies the date and time when the object was last updated.
@deprecated The `ProjectNext` API is deprecated in favour of the more capable `ProjectV2` API. Follow the ProjectV2 guide at <https://github.blog/changelog/2022-06-23-the-new-github-issues-june-23rd-update/>, to find a suitable replacement. Removal on 2023-01-01 UTC.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Interface.ProjectNextFieldCommon
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)
