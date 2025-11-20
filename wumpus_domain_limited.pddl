(define (domain wumpus_domain_limited)
  (:requirements :strips :typing)
  (:types square object agent creature item)

  (:predicates
    (adj ?from ?to - square)
    (pit ?s - square)
    (at ?o - object ?s - square)
    (have ?a - agent ?i - item)
    (dead ?c - creature)
    (clear ?s - square)
    (steps-left) ; artificial constraint for move limit
  )

  (:action move
    :parameters (?a - agent ?from - square ?to - square)
    :precondition (and
      (steps-left)
      (adj ?from ?to)
      (at ?a ?from)
      (not (pit ?to))
      (or (not (at wumpus ?to)) (dead wumpus))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (steps-left)) ; simulate single-use step limit
    )
  )

  (:action shoot
    :parameters (?a - agent ?from - square ?arrow - item ?w - creature ?to - square)
    :precondition (and
      (steps-left)
      (at ?a ?from)
      (adj ?from ?to)
      (at ?w ?to)
      (not (dead ?w))
      (have ?a ?arrow)
    )
    :effect (and
      (dead ?w)
      (not (steps-left))
    )
  )

  (:action grab
    :parameters (?a - agent ?i - item ?s - square)
    :precondition (and
      (steps-left)
      (at ?a ?s)
      (at ?i ?s)
    )
    :effect (and
      (have ?a ?i)
      (not (at ?i ?s))
      (not (steps-left))
    )
  )
)
