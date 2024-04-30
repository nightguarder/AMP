#lang racket
(define (fact n) ;factorial with one argument
    (if (= 0 n)
        1
        (* n (fact (- n 1)))));call the function until n =0

(display "Factorial:")
(newline)
(display (fact 3))
(newline)
;better way withtout triangular shape recursion 


(define (fact-it n)
(define (impl accum count)
    (if (= 0 count)
    accum
    (impl (* count accum) (- count 1)))) ;multiplying and taking -1 from count
    (impl 1 n)) ; calling the impl function


(display "Fact-it:")
(newline)
(display (fact-it 3))
(newline)

;Fibonaci easy

(define (fib n) ;the n-th fibonaci number
    (if (<= n 2) ;
    1 ;return 1
    (+ (fib (- n 1))
    (fib (- n 2)))));otherwise call the fib function again

(display "Fibonaci:")
(newline)
(display (fib 3))
(newline)

(define (countdown n)
    (if (= n 0) ; once we are at 0 return null
    null ; return empty list ()
    (begin  ; do the 3 things silmutaneously
    (display n)
    (newline)
    (countdown (- n 1)))))

(display "Countdown:")
(newline)
(countdown 3)
(newline)

;map
(define (my-map fn lst) ;map a function over a list
    (if (null? lst) ;check if list is empty
    null ;return empty list () after we have passed through all elements
    (cons (fn (car lst)) ; cons the first element in the list and stick the answer to the first position in the list
    (my-map fn (cdr lst)))));return list with the rest of elemenets

(display "Map:")
(newline)
(my-map abs (list 2 -3 4 5 -6))
;map with recursion

