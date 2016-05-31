module Update exposing (update)

import Types exposing
  ( Model
  , Msg(..)
  , Option(..)
  )
import Random exposing (..)
import Html.Events exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Start ->
      (Model "Start", Cmd.none)

    PlayUser userOpt ->
      (Model "Start", generate (PlayUserAndOpponent userOpt) generateOption)

    PlayUserAndOpponent userOpt opontOpt ->
      (Model (getResult userOpt opontOpt), Cmd.none)


getResult : Option -> Option -> String
getResult myOption myOpponentOption =
  case myOption of
    Steal ->
      case myOpponentOption of
        Steal -> "Both lose!"
        Still -> "You win. He lose!"
    Still ->
      case myOpponentOption of
        Steal -> "You lose. He wins!"
        Still -> "Both win a little"

generateOption : Generator Option
generateOption =
  map getOption (int 1 10)

getOption : Int -> Option
getOption value =
  if value % 2 == 0
  then Steal
  else Still

