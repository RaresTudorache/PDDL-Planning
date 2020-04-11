(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
	    customer
        plate
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
        (HoldingPlate ?a - waiter ?p - plate)
        (HoldingSomething ?a - waiter)
        (Adjacent ?a - location ?b - location)
        (HasFood ?p - plate)
        (Served ?c - customer)
        (At ?o - object ?l - location)
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
        :parameters (?a - waiter ?l - location ?p - plate)
        :precondition (and
            (not (HoldingSomething ?a))
            (At ?a ?l)
            (At ?p ?l)
        )
        :effect (and
            (HoldingSomething ?a)
            (HoldingPlate ?a ?p)
            (not (At ?p ?l))
        )
    )


    (:action HAND-OVER
        :parameters (?a - waiter ?l - location ?p - plate ?c - customer)
        :precondition (and
            (HoldingPlate ?a ?p)
            (At ?a ?l)
            (At ?c ?l)
            (HasFood ?p)
        )
        :effect (and
            (not (HoldingPlate ?a ?p))
            (not (HoldingSomething ?a))
            (Served ?c)
        )
    )


    (:action FILL
        :parameters (?a - waiter ?p - plate)
        :precondition (and
            (HoldingPlate ?a ?p)
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
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )
)