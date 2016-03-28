module Upcoming (..) where

import Graphics.Element exposing (Element)
import Graphics.Collage exposing (collage, square, solid, filled, outlined, move, LineCap(..))
import Color
import Tetromino exposing (Tetromino)
import Block


toElement : Bool -> Tetromino -> Int -> Element
toElement showNext tetromino width =
  let
    dim =
      (6 * round Block.size) - 10

    box =
      toFloat dim |> square

    border =
      (solid Color.black)

    border' =
      { border | width = 3.0, cap = Round}

    forms =
      [ filled Color.white box
      , outlined border' box
      ]

    forms' =
      if showNext then
        forms
          ++ [ move ( -tetromino.pivot.c * Block.size, -tetromino.pivot.r * Block.size )
                <| Tetromino.toForm
                <| tetromino
             ]
      else
        forms
  in
    collage width width forms'
