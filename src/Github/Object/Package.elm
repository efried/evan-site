-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.Package exposing (..)

import Github.Enum.PackageType
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


id : SelectionSet Github.ScalarCodecs.Id Github.Object.Package
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Find the latest version for the package.
-}
latestVersion :
    SelectionSet decodesTo Github.Object.PackageVersion
    -> SelectionSet (Maybe decodesTo) Github.Object.Package
latestVersion object____ =
    Object.selectionForCompositeField "latestVersion" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the name of the package.
-}
name : SelectionSet String Github.Object.Package
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| Identifies the type of the package.
-}
packageType : SelectionSet Github.Enum.PackageType.PackageType Github.Object.Package
packageType =
    Object.selectionForField "Enum.PackageType.PackageType" "packageType" [] Github.Enum.PackageType.decoder


{-| The repository this package belongs to.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet (Maybe decodesTo) Github.Object.Package
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ (Basics.identity >> Decode.nullable)


{-| Statistics about package activity.
-}
statistics :
    SelectionSet decodesTo Github.Object.PackageStatistics
    -> SelectionSet (Maybe decodesTo) Github.Object.Package
statistics object____ =
    Object.selectionForCompositeField "statistics" [] object____ (Basics.identity >> Decode.nullable)


type alias VersionRequiredArguments =
    { version : String }


{-| Find package version by version string.

  - version - The package version.

-}
version :
    VersionRequiredArguments
    -> SelectionSet decodesTo Github.Object.PackageVersion
    -> SelectionSet (Maybe decodesTo) Github.Object.Package
version requiredArgs____ object____ =
    Object.selectionForCompositeField "version" [ Argument.required "version" requiredArgs____.version Encode.string ] object____ (Basics.identity >> Decode.nullable)


type alias VersionsOptionalArguments =
    { orderBy : OptionalArgument Github.InputObject.PackageVersionOrder
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-| list of versions for this package

  - orderBy - Ordering of the returned packages.
  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.

-}
versions :
    (VersionsOptionalArguments -> VersionsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.PackageVersionConnection
    -> SelectionSet decodesTo Github.Object.Package
versions fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { orderBy = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs____ =
            [ Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodePackageVersionOrder, Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "versions" optionalArgs____ object____ Basics.identity