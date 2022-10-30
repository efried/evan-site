-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.Reactable exposing (..)

import Github.Enum.ReactionContent
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
    { onCommitComment : SelectionSet decodesTo Github.Object.CommitComment
    , onDiscussion : SelectionSet decodesTo Github.Object.Discussion
    , onDiscussionComment : SelectionSet decodesTo Github.Object.DiscussionComment
    , onIssue : SelectionSet decodesTo Github.Object.Issue
    , onIssueComment : SelectionSet decodesTo Github.Object.IssueComment
    , onPullRequest : SelectionSet decodesTo Github.Object.PullRequest
    , onPullRequestReview : SelectionSet decodesTo Github.Object.PullRequestReview
    , onPullRequestReviewComment : SelectionSet decodesTo Github.Object.PullRequestReviewComment
    , onRelease : SelectionSet decodesTo Github.Object.Release
    , onTeamDiscussion : SelectionSet decodesTo Github.Object.TeamDiscussion
    , onTeamDiscussionComment : SelectionSet decodesTo Github.Object.TeamDiscussionComment
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.Reactable
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [ Object.buildFragment "CommitComment" selections____.onCommitComment
        , Object.buildFragment "Discussion" selections____.onDiscussion
        , Object.buildFragment "DiscussionComment" selections____.onDiscussionComment
        , Object.buildFragment "Issue" selections____.onIssue
        , Object.buildFragment "IssueComment" selections____.onIssueComment
        , Object.buildFragment "PullRequest" selections____.onPullRequest
        , Object.buildFragment "PullRequestReview" selections____.onPullRequestReview
        , Object.buildFragment "PullRequestReviewComment" selections____.onPullRequestReviewComment
        , Object.buildFragment "Release" selections____.onRelease
        , Object.buildFragment "TeamDiscussion" selections____.onTeamDiscussion
        , Object.buildFragment "TeamDiscussionComment" selections____.onTeamDiscussionComment
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onCommitComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onDiscussion = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onDiscussionComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onIssue = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onIssueComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequest = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequestReview = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onPullRequestReviewComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onRelease = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onTeamDiscussion = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onTeamDiscussionComment = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Interface.Reactable
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Interface.Reactable
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| A list of reactions grouped by content left on the subject.
-}
reactionGroups :
    SelectionSet decodesTo Github.Object.ReactionGroup
    -> SelectionSet (Maybe (List decodesTo)) Github.Interface.Reactable
reactionGroups object____ =
    Object.selectionForCompositeField "reactionGroups" [] object____ (Basics.identity >> Decode.list >> Decode.nullable)


type alias ReactionsOptionalArguments =
    { after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    , content : OptionalArgument Github.Enum.ReactionContent.ReactionContent
    , orderBy : OptionalArgument Github.InputObject.ReactionOrder
    }


{-| A list of Reactions left on the Issue.

  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.
  - content - Allows filtering Reactions by emoji.
  - orderBy - Allows specifying the order in which reactions are returned.

-}
reactions :
    (ReactionsOptionalArguments -> ReactionsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ReactionConnection
    -> SelectionSet decodesTo Github.Interface.Reactable
reactions fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { after = Absent, before = Absent, first = Absent, last = Absent, content = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int, Argument.optional "content" filledInOptionals____.content (Encode.enum Github.Enum.ReactionContent.toString), Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodeReactionOrder ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "reactions" optionalArgs____ object____ Basics.identity


{-| Can user react to this subject
-}
viewerCanReact : SelectionSet Bool Github.Interface.Reactable
viewerCanReact =
    Object.selectionForField "Bool" "viewerCanReact" [] Decode.bool