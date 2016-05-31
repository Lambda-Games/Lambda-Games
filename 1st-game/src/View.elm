module View exposing ( view )

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

import Types exposing (..)

view : Model -> Html Msg
view model =
  div []
    [ text model.result
    , yourChoose
    ]

yourChoose : Html Msg
yourChoose =
  div []
    [ button [ onClick (PlayUser Steal) ] [ text "Steal" ]
    , button [ onClick (PlayUser Still) ] [ text "Still" ]
    ]

