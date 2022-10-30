-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.DependabotUpdateError exposing (..)

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


{-| The body of the error
-}
body : SelectionSet String Github.Object.DependabotUpdateError
body =
    Object.selectionForField "String" "body" [] Decode.string


{-| The error code
-}
errorType : SelectionSet String Github.Object.DependabotUpdateError
errorType =
    Object.selectionForField "String" "errorType" [] Decode.string


{-| The title of the error
-}
title : SelectionSet String Github.Object.DependabotUpdateError
title =
    Object.selectionForField "String" "title" [] Decode.string
