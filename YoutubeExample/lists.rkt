#lang racket
;Pairs
(cons 1 2) ; (1 . 2)
(cons (cons 1 2) 3) ; ((1 . 2) . 3)

;Lists
;Car and Cdr
(define lst (cons 1 2)) ; cons only takes 2 arguments!
(define mylist (cons 1 (cons 2 (cons 3 null))))

; Car - get the first element from the list
(car lst) ; 1

; Cdr - get the rest of the list
(cdr lst) ; (2 3)

(cadr mylist) ; navigate to 2nd element of mylist