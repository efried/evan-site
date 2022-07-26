-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.UpdateOrganizationWebCommitSignoffSettingPayload exposing (..)

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
clientMutationId : SelectionSet (Maybe String) Github.Object.UpdateOrganizationWebCommitSignoffSettingPayload
clientMutationId =
    Object.selectionForField "(Maybe String)" "clientMutationId" [] (Decode.string |> Decode.nullable)


{-| A message confirming the result of updating the web commit signoff setting.
-}
message : SelectionSet (Maybe String) Github.Object.UpdateOrganizationWebCommitSignoffSettingPayload
message =
    Object.selectionForField "(Maybe String)" "message" [] (Decode.string |> Decode.nullable)


{-| The organization with the updated web commit signoff setting.
-}
organization :
    SelectionSet decodesTo Github.Object.Organization
    -> SelectionSet (Maybe decodesTo) Github.Object.UpdateOrganizationWebCommitSignoffSettingPayload
organization object____ =
    Object.selectionForCompositeField "organization" [] object____ (Basics.identity >> Decode.nullable)
