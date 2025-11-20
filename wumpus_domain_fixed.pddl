(define (domain wumpus_domain_a)
(:requirements :strips :typing)
  (:types square object agent creature item)


  (:predicates
    (adj ?from ?to - square)
    (pit ?s - square)
    (at ?o - object ?s - square)
    (have ?a - agent ?i - item)
    (dead ?c - creature)
    (safe ?s - square)
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
    )
  )

  (:action grab
    :parameters (?a - agent ?i - item ?s - square)
    :precondition (and
      (at ?a ?s)
      (at ?i ?s)
    )
    :effect (and
      (have ?a ?i)
      (not (at ?i ?s))
    )
  )
)

 