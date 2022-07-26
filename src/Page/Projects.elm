module Page.Projects exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.Http
import Element
import Element.Font as Font
import Head
import Head.Seo as Seo
import OptimizedDecoder
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Secrets as Secrets
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Project =
    { name : String
    , description : Maybe String
    , homepage : Maybe String
    , forked : Bool
    , archived : Bool
    , htmlUrl : String
    }


type alias Data =
    List Project


data : DataSource Data
data =
    DataSource.Http.request
        (Secrets.succeed
            (\apiKey ->
                { url = "https://api.github.com/users/efried/repos?type=owner"
                , method = "GET"
                , headers = [ ( "Accept", "application/vnd.github+json" ), ( "Authorization", "token " ++ apiKey ) ]
                , body = DataSource.Http.emptyBody
                }
            )
            |> Secrets.with "API_KEY"
        )
        (OptimizedDecoder.list
            (OptimizedDecoder.map6
                Project
                (OptimizedDecoder.field "name" OptimizedDecoder.string)
                (OptimizedDecoder.field "description" (OptimizedDecoder.nullable OptimizedDecoder.string))
                (OptimizedDecoder.field "homepage" (OptimizedDecoder.nullable OptimizedDecoder.string))
                (OptimizedDecoder.field "fork" OptimizedDecoder.bool)
                (OptimizedDecoder.field "archived" OptimizedDecoder.bool)
                (OptimizedDecoder.field "html_url" OptimizedDecoder.string)
            )
        )
        |> DataSource.map
            (List.filter
                (\project ->
                    project.forked == False && project.archived == False
                )
            )


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Personal projects I've made"
        , locale = Nothing
        , title = "Projects"
        }
        |> Seo.website


validateNonEmptyString : String -> Maybe String
validateNonEmptyString s =
    if String.isEmpty s then
        Nothing

    else
        Just s


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Projects"
    , body =
        Element.column
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            (List.map
                (\project ->
                    Element.row
                        [ Element.padding 10
                        , Element.spacing 10
                        ]
                        [ Element.newTabLink [ Font.bold, Font.underline, Font.color (Element.rgb255 18 147 216) ]
                            { url = project.htmlUrl
                            , label = Element.text project.name
                            }
                        , Element.text
                            (case project.description of
                                Nothing ->
                                    "No description."

                                Just description ->
                                    description ++ "."
                            )
                        , case
                            project.homepage
                                |> Maybe.andThen validateNonEmptyString
                          of
                            Nothing ->
                                Element.none

                            Just homepage ->
                                Element.newTabLink [ Font.bold, Font.underline, Font.color (Element.rgb255 18 147 216) ]
                                    { url = homepage
                                    , label = Element.text "Try it out!"
                                    }
                        ]
                )
                static.data
            )
    }
