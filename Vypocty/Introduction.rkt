#lang racket
;https://docs.racket-lang.org/quick/
;define an Expression and print the result
;circle 10;
;An expression can also be a function call. 
;(circle 10);
;Je celé libovolné reálné číslo celé? 
(define (skorocele? x)
  (let* ((rounded (round x))
         (difference (abs (- x rounded))))
    (< difference 0.001)))

(define (get-number-input)
  (display"Zadejte libovolné reálné číslo: ")
  (read)) ; Načtení teploty od uživatele

(define (main)
    (let* ((number (get-number-input))
             (number (skorocele? number)))
        (display "Zadané číslo je/ není skorocelé")
    ))

(main)
;(displayln (skorocele? 7.99))   ; Výsledek: #false
;(displayln (skorocele? 7.9999)) ; Výsledek: #true
