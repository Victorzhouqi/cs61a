#lang simply-scheme
;#2
;(define (every f s)
 ; (cond ((equal? s '()) '())
  ;      (else (se (f (first s)) (every f (bf s))))))

(every (lambda (w) (* w w)) '(1 2 3 4))
(every first '(nowhere man))


;#3
(every (lambda (letter) (word letter letter)) 'purple)
(equal? (every (lambda (letter) (word letter letter)) 'purple) 'ppuurrppllee)
(equal? (every (lambda (number) (if (even? number) (word number number) number))
'(781 5 76 909 24)) '(781 5 7676 909 2424))
(equal? (keep even? '(781 5 76 909 24)) '(76 24))
(equal? (keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper) 'ooeee)
(equal? (keep (lambda (letter) (member? letter 'aeiou)) 'syzygy) "") ;empty word ""
(equal? (keep (lambda (letter) (member? letter 'aeiou)) 'purplesyzygy) 'ue)
(equal? (keep (lambda (wd) (member? 'e wd)) '(purple syzygy)) '(purple))


;#3 expert , attempted

