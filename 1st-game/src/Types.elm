module Types exposing ( Model, Msg(..) )

type alias Model =
  { result : String
  }

type Msg = Steal | Still

