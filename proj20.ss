;n! means n × (n − 1) × ... × 3 × 2 × 1
;Find the sum of the digits in the number 100!

(define (fac n)
  (define (iter n prod)
    (if (= n 0)
        prod
        (iter (- n 1) (* prod n))))
  (iter n 1))

(define (fac-add n)                   ;[fac-add 100]
  (define (iter num sum)
    (if (< num 10)
        (+ sum num)
        (iter (quotient num 10) (+ sum (spl num)))))
  (iter (fac n) 0))

(define (spl num)
  (- num (* 10 (quotient num 10))))
  
