-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.Comparison exposing (..)

import Github.Enum.ComparisonStatus
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


{-| The number of commits ahead of the base branch.
-}
aheadBy : SelectionSet Int Github.Object.Comparison
aheadBy =
    Object.selectionForField "Int" "aheadBy" [] Decode.int


{-| The base revision of this comparison.
-}
baseTarget :
    SelectionSet decodesTo Github.Interface.GitObject
    -> SelectionSet decodesTo Github.Object.Comparison
baseTarget object____ =
    Object.selectionForCompositeField "baseTarget" [] object____ Basics.identity


{-| The number of commits behind the base branch.
-}
behindBy : SelectionSet Int Github.Object.Comparison
behindBy =
    Object.selectionForField "Int" "behindBy" [] Decode.int


type alias CommitsOptionalArguments =
    { after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-| The commits which compose this comparison.

  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.

-}
commits :
    (CommitsOptionalArguments -> CommitsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ComparisonCommitConnection
    -> SelectionSet decodesTo Github.Object.Comparison
commits fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs____ =
            [ Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "commits" optionalArgs____ object____ Basics.identity


{-| The head revision of this comparison.
-}
headTarget :
    SelectionSet decodesTo Github.Interface.GitObject
    -> SelectionSet decodesTo Github.Object.Comparison
headTarget object____ =
    Object.selectionForCompositeField "headTarget" [] object____ Basics.identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.Comparison
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The status of this comparison.
-}
status : SelectionSet Github.Enum.ComparisonStatus.ComparisonStatus Github.Object.Comparison
status =
    Object.selectionForField "Enum.ComparisonStatus.ComparisonStatus" "status" [] Github.Enum.ComparisonStatus.decoder
