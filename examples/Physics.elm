import Focus exposing (..)
import Graphics.Element exposing (Element, show)

type alias Point =
    { x : Float
    , y : Float
    }

type alias Object =
    { position : Point
    , velocity : Point
    }

object : Object
object =
    { position = { x=3, y=4 }
    , velocity = { x=1, y=1 }
    }

physics : Float -> Object -> Object
physics dt object =
    object
        |> update (position => x) (\px -> px + object.velocity.x * dt)
        |> update (position => y) (\py -> py + object.velocity.y * dt)

main : Element
main = show (physics 1 object)


-- Create all of the Foci

x : Focus { r | x:a } a
x = create .x (\x r -> { r | x <- x })

y : Focus { r | y:a } a
y = create .y (\y r -> { r | y <- y })

position : Focus { r | position:a } a
position =
    create .position (\x r -> { r | position <- x })

velocity : Focus { r | velocity:a } a
velocity =
    create .velocity (\x r -> { r | velocity <- x })

