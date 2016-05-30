module Update exposing (update)

import Types exposing ( Model, Msg(..) )

update : Msg -> Model -> Model
update msg model =
  case msg of
    Steal ->
      { model | result = "You win!" }

    Still ->
      { model | result = "You loose!" }

