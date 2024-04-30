#lang racket
; Ctverec a obdelnik
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


(define (plocha utvar)
  (cond ((ctverec? utvar) (* (ctverec-strana utvar) (ctverec-strana utvar))) ; plocha čtverce
        ((obdelnik? utvar) (* (obdelnik-strana1 utvar) (obdelnik-strana2 utvar))))) ; plocha obdélníku

; hledani v seznamu dle barvy
(define (filtr utvar barva)
  (string=? barva 
  (if (ctverec? utvar) (ctverec-barva utvar) (obdelnik-barva utvar))))

; vypocet celkove plochy
(define (barevnaplocha barva obrazek)
  (apply + (map plocha 
  (filter (lambda (utvar) (filtr utvar barva)) obrazek))))

(display (barevnaplocha "blue" obraz)) ;49
(newline)