import Html            exposing (Html, br, button, div, text, p)
import Html.App        exposing (program)
import Html.Events     exposing (onClick)
import Html.Attributes exposing (disabled)

import Task         exposing (Task)
import Random       exposing (float, bool, generate, map)
import Process

-- MODEL

type alias Model =
  { msg : String
  , disabled : Bool
  , yourFace : String
  , yourOpntFace : String
  }

type Option
  = Steal
  | Still

type Msg
  = Play Option
  | CalcDelayCount Option Float
  | Delay Option
  | Fight Option Option
  | Restart

type alias Result =
  { resultMsg : String
  , resultYourFace : String
  , resultYourOpntFace : String
  }

normalFace : String
normalFace = ":¬|"

sadFace : String
sadFace = ":'("

coolFace : String
coolFace = "B)"

happyFace : String
happyFace = ":)"

-- MAIN

main =
  program
    { init = (initModel, Cmd.none)
    , view   = view
    , update = update
    , subscriptions = always Sub.none
    }

initModel : Model
initModel =
  { msg = "Lets start!"
  , disabled = False
  , yourFace = normalFace
  , yourOpntFace = normalFace
  }

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Play userOpt ->
            Model "..." True normalFace normalFace ! [ generate (CalcDelayCount userOpt) (float 250 2500) ]

        CalcDelayCount option time ->
            model ! [ sleep time (Delay option) ]

        Delay option ->
            model ! [ generate (Fight option) optionGenerator ]

        Fight option option2 ->
          let
            result = getResult option option2
          in
            Model result.resultMsg True result.resultYourFace result.resultYourOpntFace ! [ sleep 2500 Restart ]

        Restart ->
            Model "Start!" False normalFace normalFace ! []

optionGenerator : Random.Generator Option
optionGenerator =
    map (\b -> if b then Steal else Still) bool

getResult : Option -> Option -> Result
getResult option option2 =
    case (option, option2) of
        (Steal, Steal) -> Result "Both lose!" sadFace sadFace
        (Steal, Still) -> Result "You win. He lose!" coolFace sadFace
        (Still, Steal) -> Result "You lose. He wins!" sadFace coolFace
        (Still, Still) -> Result "Both win a little" happyFace happyFace

sleep : Float -> Msg -> Cmd Msg
sleep time msg =
    Task.perform (always msg) (always msg) (Process.sleep time)

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ p [] [ text "You:", br [] [], text model.yourFace ]
        , text model.msg
        , p [] [ text "Your opponent:", br [] [], text model.yourOpntFace ]
        , br [] []
        , button [ onClick (Play Steal), disabled model.disabled ] [ text "Steal" ]
        , button [ onClick (Play Still), disabled model.disabled ] [ text "Still" ]
        ]
