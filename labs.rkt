lang simply-scheme
#|
;this is week1 lab

(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))
(define (pl-done? wd)
  (vowel? (first wd)))
(define (vowel? letter)
  (member? letter '(a e i o u)))
(define (dupls-removed s)
  (cond ((equal? s '()) '())
        ((member? (first s) (bf s)) (dupls-removed (bf s)))
        (else (se (first s) (dupls-removed (bf s))))))


(equal? (dupls-removed '(a b c a e d e b))
        '(c a d e b))
(equal? (dupls-removed '(a b c))
        '(a b c))
(equal? (dupls-removed '(a a a a b a a))
        '(b a))


;Week 1 lab finished

;starting week 2 lab
;#3
(define (g) (lambda (_) 3))
((g) 1)
;#4
(define (f) (lambda () (lambda (_) 1) ))
(((f)) 3)
(define h (lambda() (lambda() (lambda(_) 1))))
(((h)) 3)
;#5
(define (t f) (lambda (x) (f(f(f x)))))
(define plus1 (lambda (x) (+ x 1)))
(= ((t plus1) 0) 3)
;#6
(define (s x)
  (+ 1 x))
(= ((t s) 0) 3)
(= ((t(t s)) 0) 9)
(= (((t t) s) 0)  27)
; week2 lab finished

;Starting week3 lab

; 4.   5.
(define (type-check f predicate datum)
  (cond ((predicate datum) (f datum))
        (else #f)))

(define (make-safe f predicate)
  (lambda (x) (type-check f predicate x)))
(define safe-sqrt (make-safe sqrt number?))

(safe-sqrt 'hello)
(safe-sqrt 4)

;week 4 lab
(define x (cons 4 5))
(car x)
(cdr x)
(define y (cons 'hello 'goodbye))
(define z (cons x y))
(car (cdr z))
(cdr (cdr z))

(cdr (car z)) ;5
(car (cons 8 3));8
(car z) ;'(4 . 5)

(define (make-rational num den)
(cons num den))
(define (numerator rat)
(car rat))
(define (denominator rat)
(cdr rat))
(define (*rat a b)
(make-rational (* (numerator a) (numerator b))
(* (denominator a) (denominator b))))
(define (print-rat rat)
(word (numerator rat) '/ (denominator rat)))

(print-rat (make-rational 2 3)) ;"2/3"
(print-rat (*rat (make-rational 2 3) (make-rational 1 4)));"2/12"

;week5 lab
(define l1 (list 2 3 4))
(define l2 (list 'a 'b))
(list l1 l2)

|#
;week 6 lab
; don't know how to start the interpreter


;week 7 lab
(define-class (counter)
  (instance-vars (count 0))
  (class-vars (total 0))
  (method (next)
    (set! total (+ total 1))
    (set! count (+ count 1))
    (list count total)))

(define-class (person name)
  (method (say stuff) stuff)
  (method (ask stuff) (ask self 'say (se '(would you please) stuff)))
  (method (greet) (ask self 'say (se '(hello my name is) name))) )

(define-class (pigger name)
  (parent (person name))
  (method (pigl wd)
    (if (member? (first wd) '(a e i o u))
	(word wd 'ay)
	(ask self 'pigl (word (bf wd) (first wd))) ))
  (method (say stuff)
    (if (word? stuff)
	(ask self 'pigl stuff)
	(map (lambda (w) (ask self 'pigl w)) stuff))) )

(define-class (squarer)
  (default-method (* message message))
  (method (7) 'buzz) )

(define-class (counter)
  (instance-vars (count 0))
  (class-vars (total 0) (counters '()))
  (initialize (set! counters (cons self counters)))
  (method (next)
    (set! total (+ total 1))
    (set! count (+ count 1))
    (list count total)))

(define-class (pigger name)
  (parent (person name))
  (method (pigl wd)
    (if (member? (first wd) '(a e i o u))
	(word wd 'ay)
	(ask self 'pigl (word (bf wd) (first wd))) ))
  (method (say stuff)
    (if (word? stuff)
	(if (equal? stuff 'my) (usual 'say stuff) (ask self 'pigl stuff))
	(map (lambda (w) (ask self 'say w)) stuff))) )


