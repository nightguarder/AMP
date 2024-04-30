#lang racket

(define-struct zbozi (nazev cena kusu))

(define sklad
( list
(make-zbozi "Tabulka" 100 10)
(make-zbozi "Caj" 5 100)
(make-zbozi "Mys" 299 5)))

;Vyhledej cenu zbozi v skladu
(define (najdi-cenu jmeno seznam)
  (cond 
  [(empty? seznam) null] ; vrat prazdny seznam
    [(string=? jmeno (zbozi-nazev (car seznam)))
      (zbozi-cena (car seznam))] 
      [else (najdi-cenu jmeno (cdr seznam))])) ; vrat zbytek seznamu rekurzivne
;Vyhledej cenu pocet zbozi v skladu

(define (najdi-cenu-kusu jmeno seznam)
  (cond
  [(empty? seznam) null] ; vrat prazdny seznam
  [(string=? jmeno (zbozi-nazev (car seznam)))
    (list (zbozi-cena (car seznam)) (zbozi-kusu (car seznam)))]
    [else (najdi-cenu-kusu jmeno (cdr seznam))])) ; vrat zbytek seznamu rekurzivne

;Celkova cena zbozi ve skladu
(define (celkova-cena seznam)
  (if (null? seznam)
    0 ;vrat prazdny seznam
    (+ (* (zbozi-cena (car seznam)) (zbozi-kusu (car seznam))) ;vynasob a pak secti
      (celkova-cena (cdr seznam)))))

;Vypocitej cenu objednavky zbozi
(define (cena-objednavky objednavka sklad)
  (if (null? objednavka)
    0 ;seznam je prazzny a vrat 0
    (+ (* (car (najdi-cenu-kusu (caar objednavka) sklad)) (cadar objednavka)) ;vynasob a pak secti
    (cena-objednavky (cdr objednavka) sklad))))

;Vydej zbozi ze skladu
;+ odstraneni kusu ze skladu
(define (vydej-ze-skladu nazev kusu seznam)
(cond 
  [(empty? seznam) null] ; vrat prazdny seznam)
  [(string=? nazev (zbozi-nazev (car seznam))) ;hledej zbozi v seznamu (sklad)
    (odeber-kusy seznam kusu)] ;odeber polozku
    [else (cons (car seznam) ; vrat zbytek seznamu
    (vydej-ze-skladu nazev kusu (cdr seznam)))]))

;Odstraneni kusu zbozi ze skladu
;+klesne-li počet kusů daného zboží na nulu, odstraňte je ze seznamu

(define (odeber-kusy seznam kusu)
  (if (>= kusu (zbozi-kusu (car seznam))) (cdr seznam)
  (cons
    (make-zbozi (zbozi-nazev (car seznam))
      (zbozi-cena (car seznam))
      (- (zbozi-kusu (car seznam)) 
      kusu))
(cdr seznam))))



(newline)
;(display (najdi-cenu "Caj" sklad))
(display (najdi-cenu-kusu "Caj" sklad)) 
(newline)
(display "Celkova cena zbozi ve skladu:")
(display (celkova-cena sklad)) ;2995 (299*5 + 5*100 + 100*10)
(newline)
(display "Cena objednavky:")
(display (cena-objednavky '(("Tabulka" 1) ("Caj" 4)) sklad))
(newline)
(display "Vydej ze skladu:")
(display (vydej-ze-skladu "Caj" 5 sklad))
(newline)

;(display sklad) ;Vypis aktualni stav skladu