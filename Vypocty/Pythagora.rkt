#lang racket
;Delka odvesny
(define (prepona a b)
    (sqrt ( +(* a a) (* b b)))) ; sqrt(a^2 + b^2)

;Pravouhly trojuhelnik
(define (pravouhly a b c)
    (let* ((a2 (* a a))
             (b2 (* b b))
             (c2 (* c c)))
        (if (= (+ a2 b2) c2)
            "Trojúhelník je pravoúhlý."
            "Trojúhelník není pravoúhlý.")))
;delka prepony pokud a=3 b=4
(define result (prepona 3 4))
(display "Délka přepony pro odvěsny 3 a 4 je: ")
(display result)
(newline)
(define result2(pravouhly 3 4 5))
(display result2)
(newline)