-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.SponsorsActivity exposing (..)

import Github.Enum.SponsorsActivityAction
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


{-| What action this activity indicates took place.
-}
action : SelectionSet Github.Enum.SponsorsActivityAction.SponsorsActivityAction Github.Object.SponsorsActivity
action =
    Object.selectionForField "Enum.SponsorsActivityAction.SponsorsActivityAction" "action" [] Github.Enum.SponsorsActivityAction.decoder


id : SelectionSet Github.ScalarCodecs.Id Github.Object.SponsorsActivity
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The tier that the sponsorship used to use, for tier change events.
-}
previousSponsorsTier :
    SelectionSet decodesTo Github.Object.SponsorsTier
    -> SelectionSet (Maybe decodesTo) Github.Object.SponsorsActivity
previousSponsorsTier object____ =
    Object.selectionForCompositeField "previousSponsorsTier" [] object____ (Basics.identity >> Decode.nullable)


{-| The user or organization who triggered this activity and was/is sponsoring the sponsorable.
-}
sponsor :
    SelectionSet decodesTo Github.Union.Sponsor
    -> SelectionSet (Maybe decodesTo) Github.Object.SponsorsActivity
sponsor object____ =
    Object.selectionForCompositeField "sponsor" [] object____ (Basics.identity >> Decode.nullable)


{-| The user or organization that is being sponsored, the maintainer.
-}
sponsorable :
    SelectionSet decodesTo Github.Interface.Sponsorable
    -> SelectionSet decodesTo Github.Object.SponsorsActivity
sponsorable object____ =
    Object.selectionForCompositeField "sponsorable" [] object____ Basics.identity


{-| The associated sponsorship tier.
-}
sponsorsTier :
    SelectionSet decodesTo Github.Object.SponsorsTier
    -> SelectionSet (Maybe decodesTo) Github.Object.SponsorsActivity
sponsorsTier object____ =
    Object.selectionForCompositeField "sponsorsTier" [] object____ (Basics.identity >> Decode.nullable)


{-| The timestamp of this event.
-}
timestamp : SelectionSet (Maybe Github.ScalarCodecs.DateTime) Github.Object.SponsorsActivity
timestamp =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "timestamp" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)