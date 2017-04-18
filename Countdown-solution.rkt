#lang racket

;4 sets of random small numbers are defined here for use later on
;all the small numbers are set between 1 and 11 so that 10 can be used as the random function takes in (a b) but returns b-1 as the biggest number
;a will still return 1 fine
(define S1(random 1 11))
(define S2(random 1 11))
(define S3(random 1 11))
(define S4(random 1 11))

;2 sets of random big numbers are defined here for use later on
;all the big numbers here a list of 25, 50, 75 and 100 and only one of these 4 values can be chosen
(define B1(list-ref (list 25 50 75 100) (random 4)))
(define B2(list-ref (list 25 50 75 100) (random 4)))

;T is our target number and thus has to be a random number between 101 and 999 (1000-1 allows us to have 999) inclusive
(define T(random 101 1000))

;Calling all our defined functions here so we can see some ouput so far
S1
S2
S3
S4
B1
B2
T

(define allnumbs(list S1
S2
S3
S4
B1
B2))

;List of operands, cartesian product and permutations as shown in class
(define ops(list '+ '-  '/  '*))

(define all-ops(cartesian-product ops ops ops ops ops))
;all-ops

(define start-perm (cartesian-product allnumbs))

(define (alladds l)
   (map
    (lambda (i) (apply + i))
    (combinations l)))

;(allcombs start-perm)
;(alladds allnumbs)

;Remove duplicates so we don't get the same results more than once
(define X(remove-duplicates(permutations start-perm)))
;Cartesian product of our permutated list and our list of operands
(define alloutcomes(remove-duplicates(cartesian-product  X all-ops)))
alloutcomes
;Function allows us to define how we'll set up our functions for sum, multiply, divide and subtraction
;Function that will allow us to cycle through our operands in a later funtion
;Adapted from Recursion.rkt by ianmcloughlin shown in class
;(define (f oper l)
 ; (if (null? l)
  ;    0
   ;   (oper (car l) (f oper (cdr l)))))
;Function changed for multiply and division due to 0 causing errors while 1 causes miscalulation on sum and subtract
;(define (f1 oper l)
 ; (if (null? l)
 ;     1
  ;    (oper (car l) (f1 oper (cdr l)))))
;Here we use the function above to start the summing part of our cycling function
;(define (fsum l) (f + l))
;Here we use the function above to start the multiplying part of our cycling function
;(define (fmult l) (f1 * l))
;Here we use the function above to start the subtracting part of our cycling function
;(define (fsub l) (f - l))
;Here we use the function above to start the dividing part of our cycling function
;(define (fdiv l) (f1 / l))
;Here we define a list with all our operands so that we can instead use this function to save lines and recurse through our operands
;Allowing us to not have to brute force our way to an answer but instead cycle through these operands and give us all the answers we are looking for
;(define loper (list fsum fmult fsub fdiv))
 ;   (if (null? list)
  ;      0
   ;     ((car list)))

;(define (apply-function-list flist )
 ; (map (lambda (f)
  ;       (f (list )))
   ;    flist ))

;(apply-function-list (list fsum fmult fsub fdiv))

;(fsum (list S1 S2))


;Summing function block
;List of 2 items
;Define S1 as primary number Block of 2 number lists
;(fsum (list S1 S2))
;(fsum (list S1 S3))
;(fsum (list S1 S4))
;(fsum (list S1 B1))
;(fsum (list S1 B2))

;Define S2 as primary number Block of 2 number lists
;(fsum (list S2 S1))
;(fsum (list S2 S3))
;(fsum (list S2 S4))
;(fsum (list S2 B1))
;(fsum (list S2 B2))

;Define S3 as primary number Block of 2 number lists
;(fsum (list S3 S1))
;(fsum (list S3 S2))
;(fsum (list S3 S4))
;(fsum (list S3 B1))
;(fsum (list S3 B2))

;Define S4 as primary number Block of 2 number lists
;(fsum (list S4 S1))
;(fsum (list S4 S2))
;(fsum (list S4 S3))
;(fsum (list S4 B1))
;(fsum (list S4 B2))

;Define B1 as primary number Block of 2 number lists
;(fsum (list B1 S1))
;(fsum (list B1 S2))
;(fsum (list B1 S3))
;(fsum (list B1 S4))
;(fsum (list B1 B2))

;Define B2 as primary number Block of 2 number lists
;(fsum (list B2 S1))
;(fsum (list B2 S2))
;(fsum (list B2 S3))
;(fsum (list B2 S4))
;(fsum (list B2 B1))

;List of 3 items
;Define S1 as primary number Block of 3 number lists
;(fsum (list S1 S2 S3))
;(fsum (list S1 S2 S4))
;(fsum (list S1 S2 B1))
;(fsum (list S1 S2 B2))
;(fsum (list S1 S3 S2))
;(fsum (list S1 S3 S4))
;(fsum (list S1 S3 B1))
;(fsum (list S1 S3 B2))
;(fsum (list S1 S4 S2))
;(fsum (list S1 S4 S3))
;(fsum (list S1 S4 B1))
;(fsum (list S1 S4 B2))
;(fsum (list S1 B1 S2))
;(fsum (list S1 B1 S3))
;(fsum (list S1 B1 S4))
;(fsum (list S1 B1 B2))
;(fsum (list S1 B2 S2))
;(fsum (list S1 B2 S3))
;(fsum (list S1 B2 S4))
;(fsum (list S1 B2 B1))




;List of 4 items
;Define S1 as primary number Block of 4 number lists
;(fsum (list S1 S2 S3 S4))




;List of 5 items
;Define S1 as primary number Block of 5 number lists
;(fsum (list S1 S2 S3 S4 B1))



;List of 6 items
;Define S1 as primary number Block of 6 number lists
;(fsum (list S1 S2 S3 S4 B1 B2))
