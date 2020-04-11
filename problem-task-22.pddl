(define (problem waiting-22) ;; Replace XX with task number
    (:domain waiting)
    (:objects
    	UF - location
    	UB - location
    	MB - location
    	LB - location
    	LF - location
    	MF - location
    	
    	P - plate
    	C - customer
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
		
		;; Agent starts at BUFF
		(At Agent BUFF)

		;; Empty plate at BUFF
		(At P BUFF)
		(not (HasFood P)) 

		;; Customer C is not served
		(not (Served C)) 

		;; Customer C is at LB
		(At C LB)
    )
    
    (:goal (Served C))
)