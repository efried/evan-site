module Request exposing (staticGraphqlRequest)

import DataSource exposing (DataSource)
import DataSource.Http
import Graphql.Document
import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Encode as Encode
import Pages.Secrets as Secrets


staticGraphqlRequest : String -> SelectionSet value RootQuery -> DataSource value
staticGraphqlRequest graphQLEndpoint selectionSet =
    DataSource.Http.unoptimizedRequest
        (Secrets.succeed
            (\apiKey ->
                { url = graphQLEndpoint
                , method = "POST"
                , headers = [ ( "authorization", "Bearer " ++ apiKey ) ]
                , body =
                    DataSource.Http.jsonBody
                        (Encode.object
                            [ ( "query"
                              , selectionSet
                                    |> Graphql.Document.serializeQuery
                                    |> Encode.string
                              )
                            ]
                        )
                }
            )
            |> Secrets.with "API_KEY"
        )
        (selectionSet
            |> Graphql.Document.decoder
            |> DataSource.Http.expectUnoptimizedJson
        )
