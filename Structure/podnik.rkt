#lang racket
;Values

(define a 1.0) 
(define b 2)
(define lst1 '(10 20 30 40 50))

(define-struct oddeleni (nazev zamestnanci))
(define podnik (list
    (make-oddeleni "Prodej" '("Anna Bílá" "Lída Žlutá" "Petr Modrý"))
    (make-oddeleni "Vývoj" '("Josef Zelený" "Lenka Růžová" "Alena Černá"))
    (make-oddeleni "Marketing" '("Petr Horký", "Nina Zelená", "Josef Vladný"))
))

;Vytvořte ve Scheme funkci f s argumenty a a b, která vyhodnocuje vzorec
(define (f a b)
  (/ (+ (/ a b) (/ b a)) (* a b)))

;Vytvořte ve Scheme funkci (vyber n L), která ze seznamu L vybere n-tý prvek. Pokud je n větší než délka L, vrátí prázdný seznam
(define (vyber n Lst)
    (if (or (null? Lst)(< n 1));vrat prazdny seznam
    '()
    (if (= n 1)
    (car Lst)
    (vyber (- n 1)(cdr Lst))))
)

(define (hledej-oddeleni jmeno seznam-oddeleni)
  (cond ((null? seznam-oddeleni) '())
        ((member jmeno (oddeleni-zamestnanci (car seznam-oddeleni))) 
         (oddeleni-nazev (car seznam-oddeleni)))
        (else (hledej-oddeleni jmeno (cdr seznam-oddeleni)))))


(display (f a b))
(newline)
(display (vyber 3 lst1))
(newline)
(display (hledej-oddeleni "Petr Modrý" podnik)) ; should display Prodej
(newline)
(display (hledej-oddeleni "Petr Horký" podnik)) ; should display Marketing
(newline)
(display (hledej-oddeleni "Lenka Zelená" podnik)) ; should display ()
