-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.OIDCProvider exposing (..)

import Github.Enum.OIDCProviderType
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


{-| The enterprise this identity provider belongs to.
-}
enterprise :
    SelectionSet decodesTo Github.Object.Enterprise
    -> SelectionSet (Maybe decodesTo) Github.Object.OIDCProvider
enterprise object____ =
    Object.selectionForCompositeField "enterprise" [] object____ (Basics.identity >> Decode.nullable)


type alias ExternalIdentitiesOptionalArguments =
    { membersOnly : OptionalArgument Bool
    , login : OptionalArgument String
    , userName : OptionalArgument String
    , after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    }


{-| ExternalIdentities provisioned by this identity provider.

  - membersOnly - Filter to external identities with valid org membership only
  - login - Filter to external identities with the users login
  - userName - Filter to external identities with the users userName/NameID attribute
  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.

-}
externalIdentities :
    (ExternalIdentitiesOptionalArguments -> ExternalIdentitiesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ExternalIdentityConnection
    -> SelectionSet decodesTo Github.Object.OIDCProvider
externalIdentities fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { membersOnly = Absent, login = Absent, userName = Absent, after = Absent, before = Absent, first = Absent, last = Absent }

        optionalArgs____ =
            [ Argument.optional "membersOnly" filledInOptionals____.membersOnly Encode.bool, Argument.optional "login" filledInOptionals____.login Encode.string, Argument.optional "userName" filledInOptionals____.userName Encode.string, Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "externalIdentities" optionalArgs____ object____ Basics.identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.OIDCProvider
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The OIDC identity provider type
-}
providerType : SelectionSet Github.Enum.OIDCProviderType.OIDCProviderType Github.Object.OIDCProvider
providerType =
    Object.selectionForField "Enum.OIDCProviderType.OIDCProviderType" "providerType" [] Github.Enum.OIDCProviderType.decoder


{-| The id of the tenant this provider is attached to
-}
tenantId : SelectionSet String Github.Object.OIDCProvider
tenantId =
    Object.selectionForField "String" "tenantId" [] Decode.string
