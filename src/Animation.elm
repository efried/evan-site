module Animation exposing (empty, spin, wave)

import Simple.Animation as Animation
import Simple.Animation.Property as P


empty : Animation.Animation
empty =
    Animation.empty


spin : Animation.Animation
spin =
    Animation.fromTo
        { duration = round (1 / 33 * 60000)
        , options = [ Animation.loop, Animation.linear ]
        }
        [ P.rotate 0 ]
        [ P.rotate 360 ]


wave : Animation.Animation
wave =
    Animation.steps
        { startAt = [ P.x 0, P.rotate 0 ]
        , options = [ Animation.easeInOut ]
        }
        [ Animation.step 500 [ P.x 5, P.rotate 5 ]
        , Animation.step 500 [ P.x -5, P.rotate -10 ]
        , Animation.step 500 [ P.x 5, P.rotate 5 ]
        , Animation.step 500 [ P.x -5, P.rotate -10 ]
        ]
