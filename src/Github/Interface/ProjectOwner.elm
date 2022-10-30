-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.ProjectOwner exposing (..)

import Github.Enum.ProjectState
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
    { onOrganization : SelectionSet decodesTo Github.Object.Organization
    , onRepository : SelectionSet decodesTo Github.Object.Repository
    , onUser : SelectionSet decodesTo Github.Object.User
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.ProjectOwner
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [ Object.buildFragment "Organization" selections____.onOrganization
        , Object.buildFragment "Repository" selections____.onRepository
        , Object.buildFragment "User" selections____.onUser
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onOrganization = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onUser = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


id : SelectionSet Github.ScalarCodecs.Id Github.Interface.ProjectOwner
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


type alias ProjectRequiredArguments =
    { number : Int }


{-| Find project by number.

  - number - The project number to find.

-}
project :
    ProjectRequiredArguments
    -> SelectionSet decodesTo Github.Object.Project
    -> SelectionSet (Maybe decodesTo) Github.Interface.ProjectOwner
project requiredArgs____ object____ =
    Object.selectionForCompositeField "project" [ Argument.required "number" requiredArgs____.number Encode.int ] object____ (Basics.identity >> Decode.nullable)


type alias ProjectsOptionalArguments =
    { orderBy : OptionalArgument Github.InputObject.ProjectOrder
    , search : OptionalArgument String
    , states : OptionalArgument (List Github.Enum.ProjectState.ProjectState)
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-| A list of projects under the owner.

  - orderBy - Ordering options for projects returned from the connection
  - search - Query to search projects by, currently only searching by name.
  - states - A list of states to filter the projects by.
  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.

-}
projects :
    (ProjectsOptionalArguments -> ProjectsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ProjectConnection
    -> SelectionSet decodesTo Github.Interface.ProjectOwner
projects fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { orderBy = Absent, search = Absent, states = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs____ =
            [ Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodeProjectOrder, Argument.optional "search" filledInOptionals____.search Encode.string, Argument.optional "states" filledInOptionals____.states (Encode.enum Github.Enum.ProjectState.toString |> Encode.list), Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "projects" optionalArgs____ object____ Basics.identity


{-| The HTTP path listing owners projects
-}
projectsResourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Interface.ProjectOwner
projectsResourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "projectsResourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The HTTP URL listing owners projects
-}
projectsUrl : SelectionSet Github.ScalarCodecs.Uri Github.Interface.ProjectOwner
projectsUrl =
    Object.selectionForField "ScalarCodecs.Uri" "projectsUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| Can the current viewer create new projects on this owner.
-}
viewerCanCreateProjects : SelectionSet Bool Github.Interface.ProjectOwner
viewerCanCreateProjects =
    Object.selectionForField "Bool" "viewerCanCreateProjects" [] Decode.bool
