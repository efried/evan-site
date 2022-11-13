-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.OrganizationTeamsHovercardContext exposing (..)

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


{-| A string describing this context
-}
message : SelectionSet String Github.Object.OrganizationTeamsHovercardContext
message =
    Object.selectionForField "String" "message" [] Decode.string


{-| An octicon to accompany this context
-}
octicon : SelectionSet String Github.Object.OrganizationTeamsHovercardContext
octicon =
    Object.selectionForField "String" "octicon" [] Decode.string


type alias RelevantTeamsOptionalArguments =
    { after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-| Teams in this organization the user is a member of that are relevant

  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.

-}
relevantTeams :
    (RelevantTeamsOptionalArguments -> RelevantTeamsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.TeamConnection
    -> SelectionSet decodesTo Github.Object.OrganizationTeamsHovercardContext
relevantTeams fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs____ =
            [ Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "relevantTeams" optionalArgs____ object____ Basics.identity


{-| The path for the full team list for this user
-}
teamsResourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.OrganizationTeamsHovercardContext
teamsResourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "teamsResourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The URL for the full team list for this user
-}
teamsUrl : SelectionSet Github.ScalarCodecs.Uri Github.Object.OrganizationTeamsHovercardContext
teamsUrl =
    Object.selectionForField "ScalarCodecs.Uri" "teamsUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The total number of teams the user is on in the organization
-}
totalTeamCount : SelectionSet Int Github.Object.OrganizationTeamsHovercardContext
totalTeamCount =
    Object.selectionForField "Int" "totalTeamCount" [] Decode.int
