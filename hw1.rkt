#lang simply-scheme
;week1 homework hw1
;#2
(define (squares s)
  (if (equal? s '())
      '()
      (se (square (first s)) (squares (bf s)))))
(define (square x) (* x x))

(equal? (squares '(2 3 4 5)) '(4 9 16 25))
;#3
(define (switch s)
  (cond ((equal? s '()) '())
        ((equal? (first s) 'you) (se 'me (switch (bf s))))
        ((equal? (first s) 'You) (se 'i (switch (bf s))))
        ((or (equal? (first s) 'I) (equal? (first s) 'me)) (se 'you (switch (bf s))))
        (else (se (first s) (switch (bf s))))))
            
(equal? (switch '(You told me that I should wake you up)) '(i told you that you should wake me up))
;#4
(define (ordered? s)
  (cond ((equal? (bf s) '()) #t)
        ((< (first s) (first (bf s))) (ordered? (bf s)))
        (else #f)))
(ordered? '(1 2 3 4 5))
(ordered? '(1 2 3 5 4));#f ;is empty list ordered?  one word list?
(ordered? '(4 1 222 2));#f
;#5
(define (ends-e s)
  (cond ((equal? s '())'())
        ((equal? (last (first s)) 'e) (se (first s) (ends-e (bf s))))
        (else (ends-e (bf s)))))
(equal? (ends-e '(please put the salami above the blue elephant))
        '(please the above the blue))
;#6 ????
  
  




