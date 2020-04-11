(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
	customer
	plate
	broom
        ;; Fill in additional types here
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (HoldingSomething ?a - waiter)
        (Adjacent ?a - location ?b - location)
        (HasFood ?p - plate)
        (Served ?c - customer)
        (At ?o - object ?l - location)

        (BrokenPlate ?l - location)
        (HoldingObject ?a - waiter ?q - object)

    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    ;(:action dummy-action
    ;    :parameters (?obj - object)
    ;    :precondition (and
    ;        (dummy-pred-1 ?obj)
    ;        (dummy-pred-2 ?obj)
    ;    )
    ;    :effect (and
    ;        (not (dummy-pred-1 ?obj))
    ;        (dummy-pred-3 ?obj)
    ;    )
    ;)

    (:action PICK-UP
        :parameters (?a - waiter ?l - location ?q - object)
        :precondition (and
            (not (HoldingSomething ?a))
            (At ?a ?l)
            (At ?q ?l)
        )
        :effect (and
            (HoldingSomething ?a)
            (HoldingObject ?a ?q)
            (not (At ?q ?l))
        )
    )

    (:action PUT-DOWN
        :parameters (?a - waiter ?l - location ?q - object)
        :precondition (and
            (HoldingObject ?a ?q)
            (At ?a ?l)
        )
        :effect (and
            (not (HoldingSomething ?a))
            (not (HoldingObject ?a ?q))
        )
    )

    (:action SWEEP-UP
        :parameters (?a - waiter ?from - location ?target - location ?b - broom)
        :precondition (and
            (HoldingObject ?a ?b)
            (BrokenPlate ?target)
            (At ?a ?from)
            (Adjacent ?from ?target)
        )
        :effect (and
            (not (BrokenPlate ?target))
        )
    )

    (:action HAND-OVER
        :parameters (?a - waiter ?l - location ?p - plate ?c - customer)
        :precondition (and
            (HoldingObject ?a ?p)
            (At ?a ?l)
            (At ?c ?l)
            (HasFood ?p)
        )
        :effect (and
            (not (HoldingObject ?a ?p))
            (not (HoldingSomething ?a))
            (Served ?c)
        )
    )

    (:action FILL
        :parameters (?a - waiter ?p - plate)
        :precondition (and
            (HoldingObject ?a ?p)
            (not (HasFood ?p))
            (At ?a BUFF)
        )
        :effect (HasFood ?p)
    )

        (:action MOVE
        :parameters (?a - waiter ?from - location ?to - location)
        :precondition (and
            (At ?a ?from)
            (not (= ?from ?to))
            (Adjacent ?from ?to)
	(not (BrokenPlate ?to))
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )
)