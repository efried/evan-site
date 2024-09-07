module Animation exposing (wave)

import Simple.Animation as Animation
import Simple.Animation.Property as P


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
