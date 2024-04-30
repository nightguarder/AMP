#lang racket

(define (celsius->fahrenheit c)
  (let ((fahrenheit (* c 9/5 32)))
    fahrenheit))

(define (get-celsius-input)
  (display "Zadej teplotu v stupních Celsia: ")
  (read)) ; Načtení teploty od uživatele

(define (main)
  (let* ((celsius (get-celsius-input))
         (fahrenheit (celsius->fahrenheit celsius)))
    (display "Teplota ve stupních Fahrenheita: ")
    (displayln fahrenheit)))
display("Převod stupňů Celsia na Fahrenheit.")
(main) ; Spuštění programu

