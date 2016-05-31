module Types exposing
  ( Model
  , Msg(..)
  , Option(..)
  )

type alias Model =
  { result : String
  }

type Msg
  = Start
  | PlayUser Option
  | PlayUserAndOpponent Option Option

type Option =
  Steal
  | Still


