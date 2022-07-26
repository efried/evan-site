-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Enum.RoleInOrganization exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Possible roles a user may have in relation to an organization.

  - Owner - A user with full administrative access to the organization.
  - DirectMember - A user who is a direct member of the organization.
  - Unaffiliated - A user who is unaffiliated with the organization.

-}
type RoleInOrganization
    = Owner
    | DirectMember
    | Unaffiliated


list : List RoleInOrganization
list =
    [ Owner, DirectMember, Unaffiliated ]


decoder : Decoder RoleInOrganization
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OWNER" ->
                        Decode.succeed Owner

                    "DIRECT_MEMBER" ->
                        Decode.succeed DirectMember

                    "UNAFFILIATED" ->
                        Decode.succeed Unaffiliated

                    _ ->
                        Decode.fail ("Invalid RoleInOrganization type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : RoleInOrganization -> String
toString enum____ =
    case enum____ of
        Owner ->
            "OWNER"

        DirectMember ->
            "DIRECT_MEMBER"

        Unaffiliated ->
            "UNAFFILIATED"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe RoleInOrganization
fromString enumString____ =
    case enumString____ of
        "OWNER" ->
            Just Owner

        "DIRECT_MEMBER" ->
            Just DirectMember

        "UNAFFILIATED" ->
            Just Unaffiliated

        _ ->
            Nothing
