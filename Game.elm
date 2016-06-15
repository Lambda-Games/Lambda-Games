import Html exposing(..)
import Html.Attributes exposing(..)
import List exposing(map)

type alias Link =
  { link : String
  , text_ : String
  }

main =
  div []
      [ title
      , gameList
      ]

gameLinks : List Link
gameLinks =
  [ { link = "#", text_ = "LOL" }
  , { link = "#1", text_ = "LOL1" }
  ]

title : Html a
title = h1 [] [ text "Lambda Games" ]

gameList : Html a
gameList =
  ul [] (map gameItem gameLinks)

gameItem : Link -> Html a
gameItem link  =
  li []
     [ a [ href link.link] [ text link.text_ ] ]

