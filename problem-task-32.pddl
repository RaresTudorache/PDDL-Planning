(define (problem waiting-23) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
	    UF - location
		UB - location
		MB - location
		LB - location
		LF - location
		MF - location
		P1 - plate
		P2 - plate
		C1 - customer
		C2 - customer
    )
    
    (:init
	    (Adjacent BUFF UF)
        (Adjacent UF UB)
        (Adjacent UB MB)
        (Adjacent MB LB)
        (Adjacent LB LF)
        (Adjacent LF MF)
        (Adjacent MF UF)
        
        (Adjacent UF BUFF)
        (Adjacent UB UF)
        (Adjacent MB UB)
        (Adjacent LB MB)
        (Adjacent LF LB)
        (Adjacent MF LF)
        (Adjacent UF MF)
        
        ;; Agent starts at MF
        (At Agent MF)
        
        ;; Empty plate at MB
        (At P1 MB)
        (not (HasFood P1)) 
        
        ;; Empty plate at LB
        (At P2 LB)
        (not (HasFood P2))
        
        ;; Two customers, one at UB, one at LF
        (At C1 UB)
        (At C2 LF)

    )
    
    (:goal (and 
	     ;; goal is that both customers are served,
        (Served C1)
        (Served C2)
        
        ;; and the agent is at the BUFF
        (At Agent BUFF)
    ))
)