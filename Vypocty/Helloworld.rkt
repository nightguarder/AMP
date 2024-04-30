#lang racket

(define (plocha-kruhu r)
  (* 3.14 (* r r))) ; Calculate the area using π*r^2

(define radius 8)

; Compute the area of the circle
(define area (plocha-kruhu radius))

(display "The radius of the circle is: ")
(display radius)
(newline)

(display "The area of the circle with radius is: ")
(display area)
(newline)
