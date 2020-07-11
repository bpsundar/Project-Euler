;2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;What is the sum of the digits of the number 2^(1000)?

(define (pwr n)
  (define (iter n prod)
    (if (= n 0)
        prod
        (iter (- n 1) (* prod 2))))
  (iter n 1))

(define (pwr-add n)                   ;[pwr-add 1000]
  (define (iter num sum)
    (if (< num 10)
        (+ sum num)
        (iter (quotient num 10) (+ sum (spl num)))))
  (iter (pwr n) 0))

(define (spl num)
  (- num (* 10 (quotient num 10))))

(define (sq x) (* x x))
(define (fst-pwr b n)                       ;[fst-pwr 2 1000]
  (define (iter b n prod)
    (if (= n 0)
        prod
        (if (= (modulo n 2) 0)
            (iter (sq b) (/ n 2) prod)
            (iter b (- n 1) (* b prod)))))
  (iter b n 1))

                
  
      
      