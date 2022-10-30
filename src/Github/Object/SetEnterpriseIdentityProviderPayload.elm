-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.SetEnterpriseIdentityProviderPayload exposing (..)

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


{-| A unique identifier for the client performing the mutation.
-}
clientMutationId : SelectionSet (Maybe String) Github.Object.SetEnterpriseIdentityProviderPayload
clientMutationId =
    Object.selectionForField "(Maybe String)" "clientMutationId" [] (Decode.string |> Decode.nullable)


{-| The identity provider for the enterprise.
-}
identityProvider :
    SelectionSet decodesTo Github.Object.EnterpriseIdentityProvider
    -> SelectionSet (Maybe decodesTo) Github.Object.SetEnterpriseIdentityProviderPayload
identityProvider object____ =
    Object.selectionForCompositeField "identityProvider" [] object____ (Basics.identity >> Decode.nullable)
