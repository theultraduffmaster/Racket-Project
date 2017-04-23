#lang br/quicklang

;defining 'read-syntax' here with a path and a port so that the info we use in this class can be sent to my 'reader' script - stacker.rkt
;A reader, changes source code from a string of char­ac­ters for use by changing them into paren­the­sized expres­sions.
(define (read-syntax path port)
;defining port as a string
  (define args (port->lines port))
;defining 'handle-datums' which will be shortened and used as 'handle'
;~a refers to the next arguments passed to 'handle-datums' for multiple argument handling 
  (define handle-datums (format-datums ' ~a args))
;ADAPTED FROM: http://beautifulracket.com/stacker/the-expander.html
;defining a 'module', allows me to make my file an 'expander' as per the beautifulRacket documentation.
;An expander, deter­mines how these expres­sions cor­re­spond to 'real' Racket expres­sions.
;Our reader con­sisted of a read-syntax func­tion that sur­rounded each line of the source file with (handle ...), in essence “expand­ing” it.
;The expander will do something sim­i­lar on the rest of the code, with the help of 'macros'.
  
  (define module-datum `(module stacker-mod "Countdown-solution.rkt"
                          (handle-args ,@handle-datums)))
  (datum->syntax #f module-datum))

;This allow the reader to read this expander through read-syntax being provided
;Provide is very helpful for passing functions to our stacker.rkt script for use
(provide read-syntax)

;defining a macro/function to 'begin' our module. All modules have to start with a 'module-begin'
(define-macro (stacker-module-begin HANDLE-ARGS-EXPR)
  #'(#%module-begin
;show the first element on the stack
     (display (first HANDLE-ARGS-EXPR))))
;provide this module even if file renamed
;this is useful for keeping track of our file
(provide (rename-out [stacker-module-begin #%module-begin]))
'(using the 6 numbers provided and operands try and get as close to the target number as possible)
'(using the format number number opernad otherwise the stack can't evaluate it)
'(write into the script (not the console) and try it)
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
'(here is your first number)
S1 '(here is your second number)
S2 '(here is your third number)
S3 '(here is your fourth number)
S4 '(here is your fifth number)
B1 '(here is your sixth number)
B2 '(and finally your target number)
T 
(define allnumbs(list S1
S2
S3
S4
B1
B2))


;(1 -1 1 -1 1 -1 1 -1 1 -1 1)
;List of operands, cartesian product and permutations as shown in class
(define ops(list '+ '-  '/  '* ))


(define all-ops(cartesian-product ops ops ops ops ops))
;all-ops

;(define start-perm (remove-duplicates(list allnumbs)))
;start-perm

;Remove duplicates so we don't get the same results more than once
(define X(remove-duplicates(permutations allnumbs)))
;Cartesian product of our permutated list and our list of operands
;(define firstoutcome
 ; (append (car start-perm)  (car all-ops))
  ;  (if (null? all-ops)
   ;     ()
    ;    (append(car start-perm) (car (cdr all-ops))
     ;          )))

(define alloutcomes(cartesian-product X all-ops))
;alloutcomes
;(set! X (cdr X))
;(set! all-ops (cdr all-ops))

;Function allows us to define how we'll set up our functions for sum, multiply, divide and subtraction
;Function that will allow us to cycle through our operands in a later funtion
;Adapted from Recursion.rkt by ianmcloughlin shown in class
;(define (func start-perm)
 ; (if (null? all-ops)
  ;    0
   ;   (append(car start-perm) (cdr all-ops))))

;func firstoutcome
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

;The dot in front of args des­ig­nates it as a rest argu­ment:
;gather the remain­ing argu­ments in a list and assign it to this vari­able
(define (handle-args . args)
  ;for/fold works much the same way as for loops in other languages but for/fold returns a value called an accumulator but it stays inside our loop
  ;accumulator also gets replaced on every loop through
  (for/fold ([stack-acc empty])
            ([arg (filter-not void? args)])
    ;our cond will handle all the operations like pop-stack, push-stack etc. that were originally set out in http://beautifulracket.com/funstacker/the-rewrite.html
    (cond
      ;checks if it is a number and then cons onto our accumulator
      [(number? arg) (cons arg stack-acc)]
      ;or we check for operands
      [(or (equal? * arg) (equal? + arg) (equal? - arg) (equal? / arg))
       ;if they are in fact operands, we cal­cu­late op-result using the first and second ele­ments of stack-acc
       (define op-result
         (arg (first stack-acc) (second stack-acc)))
       ;here we have to forcibly drop 2 items from the stack
       (cons op-result (drop stack-acc 2))])))
;the value of the whole cond expres­sion becomes the new value of stack-acc used in the next iter­a­tion

;pass the 'handle-args' function to the 'reader' script - stacker.rkt
(provide handle-args)

;(map handle-args X)
;pass the 'handle' function to the 'reader' script - stacker.rkt
;(provide handle)

;We also pass the operands to make them available to the stacker.rkt script
(provide + * / -)

(provide S1)
(provide S2)
(provide S3)
(provide S4)
(provide B1)
(provide B2)
