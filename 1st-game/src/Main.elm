import Html.App as Html

import Html.App as Html
import Html exposing (..)
import Html.Events exposing (..)
import Update exposing (update)
import View exposing (view)
import Types exposing
  ( Model
  , Msg(..)
  , Option(..)
  )

main =
  Html.program
    { init = (Model "Let's Start!", Cmd.none)
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

