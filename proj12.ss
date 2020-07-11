;The sequence of triangle numbers is generated by adding the natural numbers.
;So the 7^(th) triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
;1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
;Let us list the factors of the first seven triangle numbers:

;     1: 1
;     3: 1,3
;     6: 1,2,3,6
;    10: 1,2,5,10
;    15: 1,3,5,15
;    21: 1,3,7,21
;    28: 1,2,4,7,14,28

;We can see that 28 is the first triangle number to have over five divisors.
;What is the value of the first triangle number to have over five hundred divisors?

(define (fac n i)
  (modulo n i))
(define (ndiv n)
  (define (iter n i c)
    (if (> i (sqrt n))
      c
      (if (= (fac n i) 0)
          (iter n (+ i 1) (+ c 2))
          (iter n (+ i 1) c))))
  (iter n 1 0))
(define (fndtri)                       
  (define(iter n i)
    (if (= i 2001)
      n
      (iter (+ n i) (+ i 1))))
  (iter 0 1))
(define (tri n)                       ;[tri 1]
  (define(iter n i)
    (if (= (modulo n 60) 0)
        (if (> (ndiv n) 500)
            n
            (iter (+ n i) (+ i 1)))
        (iter (+ n i) (+ i 1))))
  (iter n 2))