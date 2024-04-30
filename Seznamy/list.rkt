#lang racket

(define x 10)
(define y 20)
(define (z) 30)

(define double
    (lambda(x)
        (* x 2)))

;Lists
(list x y z)
(list  'x 'y 'z)
'(x y z)