-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.EnterpriseAllowPrivateRepositoryForkingPolicyValue exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible values for the enterprise allow private repository forking policy value.

  - EnterpriseOrganizations - Members can fork a repository to an organization within this enterprise.
  - SameOrganization - Members can fork a repository only within the same organization (intra-org).
  - SameOrganizationUserAccounts - Members can fork a repository to their user account or within the same organization.
  - EnterpriseOrganizationsUserAccounts - Members can fork a repository to their enterprise-managed user account or an organization inside this enterprise.
  - UserAccounts - Members can fork a repository to their user account.
  - Everywhere - Members can fork a repository to their user account or an organization, either inside or outside of this enterprise.

-}
type EnterpriseAllowPrivateRepositoryForkingPolicyValue
    = EnterpriseOrganizations
    | SameOrganization
    | SameOrganizationUserAccounts
    | EnterpriseOrganizationsUserAccounts
    | UserAccounts
    | Everywhere


list : List EnterpriseAllowPrivateRepositoryForkingPolicyValue
list =
    [ EnterpriseOrganizations, SameOrganization, SameOrganizationUserAccounts, EnterpriseOrganizationsUserAccounts, UserAccounts, Everywhere ]


decoder : Decoder EnterpriseAllowPrivateRepositoryForkingPolicyValue
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ENTERPRISE_ORGANIZATIONS" ->
                        Decode.succeed EnterpriseOrganizations

                    "SAME_ORGANIZATION" ->
                        Decode.succeed SameOrganization

                    "SAME_ORGANIZATION_USER_ACCOUNTS" ->
                        Decode.succeed SameOrganizationUserAccounts

                    "ENTERPRISE_ORGANIZATIONS_USER_ACCOUNTS" ->
                        Decode.succeed EnterpriseOrganizationsUserAccounts

                    "USER_ACCOUNTS" ->
                        Decode.succeed UserAccounts

                    "EVERYWHERE" ->
                        Decode.succeed Everywhere

                    _ ->
                        Decode.fail ("Invalid EnterpriseAllowPrivateRepositoryForkingPolicyValue type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : EnterpriseAllowPrivateRepositoryForkingPolicyValue -> String
toString enum____ =
    case enum____ of
        EnterpriseOrganizations ->
            "ENTERPRISE_ORGANIZATIONS"

        SameOrganization ->
            "SAME_ORGANIZATION"

        SameOrganizationUserAccounts ->
            "SAME_ORGANIZATION_USER_ACCOUNTS"

        EnterpriseOrganizationsUserAccounts ->
            "ENTERPRISE_ORGANIZATIONS_USER_ACCOUNTS"

        UserAccounts ->
            "USER_ACCOUNTS"

        Everywhere ->
            "EVERYWHERE"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe EnterpriseAllowPrivateRepositoryForkingPolicyValue
fromString enumString____ =
    case enumString____ of
        "ENTERPRISE_ORGANIZATIONS" ->
            Just EnterpriseOrganizations

        "SAME_ORGANIZATION" ->
            Just SameOrganization

        "SAME_ORGANIZATION_USER_ACCOUNTS" ->
            Just SameOrganizationUserAccounts

        "ENTERPRISE_ORGANIZATIONS_USER_ACCOUNTS" ->
            Just EnterpriseOrganizationsUserAccounts

        "USER_ACCOUNTS" ->
            Just UserAccounts

        "EVERYWHERE" ->
            Just Everywhere

        _ ->
            Nothing
