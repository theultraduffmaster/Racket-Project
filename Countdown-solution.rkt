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