#lang racket
; Vraci druhy prvek ze seznamu
(define (druhy List)
(car (cdr List)))
;(druhy '(1 2 3 4 5))

; Vynechat bez druheho prvku
;seznam tvořen páry; pár má dvě položky zvané car a cdr; zapisován jako (car . cdr)
(define (bezdruheho List)
(cons (car List) (cdr (cdr List))))

; Vraci List bez posledniho prvku
(define (posledni List)
(car(reverse List)))
;(posledni '(1 2 3 4 5))

;Fukce která dostane dvouprvkový seznam a prohodí poradi jeho prvku bez pouzi funkce reverse
; napriklad (prohod '(1 2) --> (2 1)
; zvazte pouziti implementace funkce jako je list, cons append)
(define (prohod List)
(if (= (length List) 2)
    (list (cadr List) (car List))
    (error "List has to have atleast 2 elements!")))

;Testovani zda je cislo 2 a 3 delitelne s N 
(define (mod23? N)
;N mod 2 je rovne 0?    N mod 3 je rovne 0?
(and (zero? (remainder N 2)) (zero? (remainder N 3))))

; Vraci x omezene na interval od mini do maxi
(define (omezit mini x maxi)
  (max mini (min x maxi)))
; Varianta 2 
 (define (omezit2 mini x maxi)
(cond 
    [(< x mini) mini]
    [(> x maxi) maxi]
    [else x]
)) 
;Vytvorte funkci (suda? List), která testuje zda jsou vsechna cisla v seznamu List sudá
;Pouzit funkce odd? even?

(define (suda? List)
  (if (empty? List)
      #true ; Seznam je prazdny takze end
      (if (even? (car List))
          (suda? (cdr List)) ; Rekurzivni volani
          #false ;Nejake cislo je liche
        )
    )
)

;Vysledky
(display (druhy '(1 2 3 4 5))) ; (2)
(newline)
(display (bezdruheho '(1 2 3 4 5))) ; (1 3 4 5)
(newline)
(display (posledni '(1 2 3 4 5))) ;(5)
(newline)
(display (prohod '(1 2))) ;(2 1)
;(display (prohod '(1 2 3))) ;(List has to have atleast 2 elements!)
(newline)
(display (mod23? 12)) ; True
(newline)
(display (omezit 0 19 100)) ; 19 
(newline)
(display(omezit 0 -5 100)) ; 0
(newline)
;Nalezne nejvetsiho spolecneho delitele cisel
(display "Nejvetsi spolecny delitel: ")
(display(gcd 372513577510367012596571619601 535168871088456288650942057633))
(newline)
(display "Nejmensi spolecny nasobek: ")
(display(lcm 17458 21901))
(newline)
(display "Vsechna cisla v seznamu jsou suda? ") 
(display (suda? '(2 4))) ;true