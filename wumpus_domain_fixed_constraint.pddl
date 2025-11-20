(define (domain wumpus_domain_a)
  (:requirements :strips :typing)
  (:types square object agent creature item)

  (:predicates
    (adj ?from ?to - square)
    (pit ?s - square)
    (at ?o - object ?s - square)
    (have ?a - agent ?i - item)
    (dead ?c - creature)
    (killed-wumpus)
    (returned-for-arrow ?a - agent)
  )

  (:action move
    :parameters (?a - agent ?from - square ?to - square)
    :precondition (and
      (adj ?from ?to)
      (at ?a ?from)
      (not (pit ?to))
      (or (not (at wumpus ?to)) (dead wumpus))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      ;; If Wumpus is dead and agent moves to base, mark returned-for-arrow
      (when (and (killed-wumpus) (= ?to sq-1-1)) (returned-for-arrow ?a))
    )
  )

  (:action shoot
    :parameters (?a - agent ?from - square ?arrow - item ?w - creature ?to - square)
    :precondition (and
      (at ?a ?from)
      (adj ?from ?to)
      (at ?w ?to)
      (not (dead ?w))
      (have ?a ?arrow)
    )
    :effect (and
      (dead ?w)
      (killed-wumpus)
    )
  )

  (:action grab
    :parameters (?a - agent ?i - item ?s - square)
    :precondition (and
      (at ?a ?s)
      (at ?i ?s)
      ;; Conditions for grabbing items
      (or
        ;; Grab anything except gold or second-arrow freely
        (not (or (= ?i the-gold) (= ?i second-arrow)))
        ;; Grab second-arrow only if Wumpus is dead
        (and (= ?i second-arrow) (killed-wumpus))
        ;; Grab gold only if Wumpus is dead, agent returned to base, and has second-arrow
        (and (= ?i the-gold) (killed-wumpus) (returned-for-arrow ?a) (have ?a second-arrow))
      )
    )
    :effect (and
      (have ?a ?i)
      (not (at ?i ?s))
    )
  )
)
