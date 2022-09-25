module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element
import Element.Font as Font
import Head
import Head.Seo as Seo
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import Style
import Url as ElmUrl
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


data : DataSource Data
data =
    DataSource.succeed ()


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
        , description = "TODO"
        , locale = Nothing
        , title = "Home"
        }
        |> Seo.website


type alias Data =
    ()


type alias ExternalContact =
    { source : String
    , username : String
    , url : ElmUrl.Url
    }


toExternalContact : ( String, String, String ) -> Maybe ExternalContact
toExternalContact ( source, username, maybeUrl ) =
    Maybe.map
        (\url -> ExternalContact source username url)
        (ElmUrl.fromString maybeUrl)


externalContactInfo : List ( String, String, String )
externalContactInfo =
    [ ( "Github", "@efried", "https://github.com/efried" )
    , ( "LinkedIn", "evanfriedenberg", "https://www.linkedin.com/in/evanfriedenberg" )
    , ( "Medium", "@evan.friedenberg", "https://www.medium.com/@evan.friedenberg" )
    , ( "Goodreads", "evanfriedenberg", "https://www.goodreads.com/evanfriedenberg" )
    ]


viewExternalAccount : ExternalContact -> Element.Element msg
viewExternalAccount { source, username, url } =
    Element.row
        []
        [ Element.column
            [ Element.width (Element.fillPortion 1) ]
            [ Element.text (source ++ ": ") ]
        , Element.column
            [ Element.width (Element.fillPortion 1)
            , Font.color Style.link
            ]
            [ Element.newTabLink
                []
                { url = ElmUrl.toString url, label = Element.text username }
            ]
        ]


viewExternalAccounts : List (Element.Element msg)
viewExternalAccounts =
    Element.text "You can find me on..."
        :: (List.filterMap
                toExternalContact
                externalContactInfo
                |> List.map viewExternalAccount
           )


wideLayout : List (Element.Element msg)
wideLayout =
    [ Element.column
        [ Element.width (Element.fillPortion 4)
        , Element.paddingXY 0 100
        , Element.spacing 16
        , Element.centerX
        ]
        [ Element.el
            [ Element.centerX, Font.size 32, Font.bold, Font.color Style.secondary ]
            (Element.text "It's me, Evan!")
        , Element.image
            [ Element.centerX
            , Element.width (Element.px 320)
            , Element.height (Element.px 320)
            ]
            { src = "images/avatar.webp", description = "Picture of Evan" }
        ]
    , Element.column
        [ Element.width (Element.fillPortion 2)
        , Element.paddingXY 0 100
        , Element.spacing 16
        ]
        viewExternalAccounts
    ]


narrowLayout : List (Element.Element msg)
narrowLayout =
    [ Element.column
        [ Element.width (Element.fillPortion 4)
        , Element.paddingXY 0 100
        , Element.spacing 16
        , Element.centerX
        ]
        (List.append
            [ Element.el
                [ Element.centerX, Font.size 32, Font.bold, Font.color Style.secondary ]
                (Element.text "It's me, Evan!")
            , Element.image
                [ Element.centerX
                , Element.width (Element.px 200)
                , Element.height (Element.px 200)
                ]
                { src = "images/avatar-small.webp", description = "Picture of Evan" }
            ]
            [ Element.column [ Element.centerX, Element.spacing 10 ] viewExternalAccounts ]
        )
    ]


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Home"
    , body =
        let
            pageBody =
                case sharedModel.device.class of
                    Element.BigDesktop ->
                        wideLayout

                    Element.Desktop ->
                        wideLayout

                    _ ->
                        narrowLayout
        in
        Element.row
            [ Element.width Element.fill
            , Element.height Element.fill
            ]
            pageBody
    }
