#lang racket

(define a 3)
(define b 4)
(define c 5)

;zaokrouleni cisla na x mist
(define (round-to x mist)
  (let ((tmp (expt 10 mist)))
    (/ (round (* x tmp)) tmp)))

(define (func a b c)
  (let ((result (/ (+ (sqrt (+ (* a a) (* b b))) (sqrt (+ (* b b) (* c c))));(sqrt(a^2 + b^2) + sqrt(b^2 + c^2)) 
     (+ a b c)))) ; / a + b + c
    (round-to result 6)))


(newline)
(display (func a b c)) ;0.950260353119404%
(newline)

;Argumenty: Co, Za = cisla, Kam = seznam cisel

(define Co 8)
(define Za 5)
(define Kam '(15 4 27 5 12))
(newline)
;(display Kam)

(define (vloz Co Za Kam)
  (cond
    ((null? Kam) (list Co)) ; vrat seznam
    ((= Za (car Kam))  ;Pokud je poradi = zadane cislo
        (cons Za (cons Co (cdr Kam)))) ;vloz cislo za prvek
    (else 
        (cons (car Kam) ;pokud se nevyskytuje
            (vloz Co Za (cdr Kam)))))) ;vrat na konec seznamu
(display "Puvodni seznam:")
(display Kam)
(newline)
(display "Vlozeno:")
(display (vloz Co Za Kam)) ;(15 4 27 5 8 12)% 
(newline)

;barva retezec znaku a strana cislo
(define-struct ctverec (barva strana))
(define-struct obdelnik (barva strana1 strana2))

(define obraz
  (list
    (make-ctverec "blue" 6) ;ctverec 6x6
    (make-ctverec "red" 4) 
    (make-obdelnik "red" 3 2)
    (make-obdelnik "black" 6 3) 
    (make-obdelnik "blue" 5 1) ;obdelnik 5x1
    (make-obdelnik "blue" 4 2))) ;obdelnik 4x2
    ;soucet ploch blue = 49

;(display obraz)
(define (plocha utvar)
  (cond ((ctverec? utvar) (* (ctverec-strana utvar) (ctverec-strana utvar))) ; plocha čtverce
        ((obdelnik? utvar) (* (obdelnik-strana1 utvar) (obdelnik-strana2 utvar))))) ; plocha obdélníku
        
        ;obdelnik strana1 * strana2

; hledani v seznamu dle barvy
(define (filtr utvar barva)
  (string=? barva 
  (if (ctverec? utvar) (ctverec-barva utvar) (obdelnik-barva utvar))))

; vypocet celkove plochy
(define (barevnaplocha barva obrazek)
  (apply + (map plocha 
  (filter 
    (lambda (utvar) (filtr utvar barva)) obrazek))))


(display "Blue: ")
(display (barevnaplocha "blue" obraz)) ;49
(newline)
(display "Red: ")
(display (barevnaplocha "red" obraz)) ;22
(newline)