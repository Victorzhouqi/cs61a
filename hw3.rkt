#lang simply-scheme

;#2 week 3
;1 .  1.16
(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (exp-iter b n)
  (define (helper b n acc)
    (cond ((= n 0) acc)
          ((even? n) (helper (square b) (/ n 2) acc))
          (else (helper b (- n 1) (* acc b) ))))
  (helper b n 1))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= 0 (remainder n test-divisor)) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try f guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try f next))))
  (try f first-guess))
;exercise 1.35 1.37 1.38
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(define (count-frac n d k)
  
  (define (helper n d k i)
    (cond ((= i k ) (/ (n i) (d i)))
          (else (/ (n i) (+ (d i) (helper n d k (+ i 1)))))))
  (helper n d k 1))
(count-frac (lambda (x) 1.0)
            (lambda (x) 1.0)
            100)
#|
(define (count-frac2 n d k)
  (cond ((= k 1) (/ (n k) (d k)))
        (else (count-frac2 n d |#
(define (di i)
  (cond ((= (remainder i 3) 0) 1.0)
        ((= (remainder i 3) 1) 1.0)
        (else (* (/ (+ i 1) 3) 2))))
(count-frac (lambda (x) 1.0)
            di
            300)

#|
(define (find-factor n)
  (define (helper n i)
    (if (remainder n i)
        i
        (helper n (+ i 1))))
  (helper n 2))
        
(define (sum-of-factors ls)
  (if (null? ls) 0
      (+ (* (first ls) (first ls)) (sum-of-factors (bf ls)))))
(sum-of-factors (list 1 2 3))
(define (list-of-factors n)
  (define (helper n ls)
    (let ((f (find-factor n))))
    (if (= f n)
        ls
        (cons f ls))
    (helper (n
      
  
(define (next-perf n)
|#