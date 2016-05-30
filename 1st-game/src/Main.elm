import Html.App as Html

import Update exposing (update)
import View exposing (view)

main =
  Html.beginnerProgram
    { model =
        { result = "Play!"
        }
    , view = view
    , update = update
    }

