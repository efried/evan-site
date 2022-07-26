-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.SponsorsListing exposing (..)

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


{-| The current goal the maintainer is trying to reach with GitHub Sponsors, if any.
-}
activeGoal :
    SelectionSet decodesTo Github.Object.SponsorsGoal
    -> SelectionSet (Maybe decodesTo) Github.Object.SponsorsListing
activeGoal object____ =
    Object.selectionForCompositeField "activeGoal" [] object____ (Basics.identity >> Decode.nullable)


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.SponsorsListing
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP path for the Sponsors dashboard for this Sponsors listing.
-}
dashboardResourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.SponsorsListing
dashboardResourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "dashboardResourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The HTTP URL for the Sponsors dashboard for this Sponsors listing.
-}
dashboardUrl : SelectionSet Github.ScalarCodecs.Uri Github.Object.SponsorsListing
dashboardUrl =
    Object.selectionForField "ScalarCodecs.Uri" "dashboardUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The full description of the listing.
-}
fullDescription : SelectionSet String Github.Object.SponsorsListing
fullDescription =
    Object.selectionForField "String" "fullDescription" [] Decode.string


{-| The full description of the listing rendered to HTML.
-}
fullDescriptionHTML : SelectionSet Github.ScalarCodecs.Html Github.Object.SponsorsListing
fullDescriptionHTML =
    Object.selectionForField "ScalarCodecs.Html" "fullDescriptionHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.SponsorsListing
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Whether this listing is publicly visible.
-}
isPublic : SelectionSet Bool Github.Object.SponsorsListing
isPublic =
    Object.selectionForField "Bool" "isPublic" [] Decode.bool


{-| The listing's full name.
-}
name : SelectionSet String Github.Object.SponsorsListing
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| A future date on which this listing is eligible to receive a payout.
-}
nextPayoutDate : SelectionSet (Maybe Github.ScalarCodecs.Date) Github.Object.SponsorsListing
nextPayoutDate =
    Object.selectionForField "(Maybe ScalarCodecs.Date)" "nextPayoutDate" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDate |> .decoder |> Decode.nullable)


{-| The HTTP path for this Sponsors listing.
-}
resourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.SponsorsListing
resourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The short description of the listing.
-}
shortDescription : SelectionSet String Github.Object.SponsorsListing
shortDescription =
    Object.selectionForField "String" "shortDescription" [] Decode.string


{-| The short name of the listing.
-}
slug : SelectionSet String Github.Object.SponsorsListing
slug =
    Object.selectionForField "String" "slug" [] Decode.string


{-| The entity this listing represents who can be sponsored on GitHub Sponsors.
-}
sponsorable :
    SelectionSet decodesTo Github.Interface.Sponsorable
    -> SelectionSet decodesTo Github.Object.SponsorsListing
sponsorable object____ =
    Object.selectionForCompositeField "sponsorable" [] object____ Basics.identity


type alias TiersOptionalArguments =
    { after : OptionalArgument String
    , before : OptionalArgument String
    , first : OptionalArgument Int
    , last : OptionalArgument Int
    , orderBy : OptionalArgument Github.InputObject.SponsorsTierOrder
    }


{-| The published tiers for this GitHub Sponsors listing.

  - after - Returns the elements in the list that come after the specified cursor.
  - before - Returns the elements in the list that come before the specified cursor.
  - first - Returns the first _n_ elements from the list.
  - last - Returns the last _n_ elements from the list.
  - orderBy - Ordering options for Sponsors tiers returned from the connection.

-}
tiers :
    (TiersOptionalArguments -> TiersOptionalArguments)
    -> SelectionSet decodesTo Github.Object.SponsorsTierConnection
    -> SelectionSet (Maybe decodesTo) Github.Object.SponsorsListing
tiers fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { after = Absent, before = Absent, first = Absent, last = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "last" filledInOptionals____.last Encode.int, Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodeSponsorsTierOrder ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "tiers" optionalArgs____ object____ (Basics.identity >> Decode.nullable)


{-| The HTTP URL for this Sponsors listing.
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Object.SponsorsListing
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)
