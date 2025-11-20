(define (problem wumpus_limited_steps)
  (:domain wumpus_domain_limited)

  (:objects
    sq-1-1 sq-1-2 sq-1-3 sq-1-4
    sq-2-1 sq-2-2 sq-2-3 sq-2-4
    sq-3-1 sq-3-2 sq-3-3 sq-3-4
    sq-4-1 sq-4-2 sq-4-3 sq-4-4 - square
    the-arrow - item
    the-gold - item
    wumpus - creature
    agent - agent
  )

  (:init
    (at agent sq-1-1)
    (have agent the-arrow)
    (at the-gold sq-2-3)
    (at wumpus sq-1-3)

    (pit sq-2-1)
    (pit sq-2-2)
    (pit sq-2-4)
    (pit sq-3-1)
    (pit sq-3-2)
    (pit sq-1-4)
    (pit sq-4-4)

    (steps-left)

    (adj sq-1-1 sq-1-2) (adj sq-1-2 sq-1-1)
    (adj sq-1-2 sq-1-3) (adj sq-1-3 sq-1-2)
    (adj sq-1-3 sq-2-3) (adj sq-2-3 sq-1-3)
    (adj sq-2-3 sq-3-3) (adj sq-3-3 sq-2-3)
    (adj sq-3-3 sq-4-3) (adj sq-4-3 sq-3-3)
  )

  (:goal (and
    (have agent the-gold)
    (at agent sq-1-1)
  ))
)
