;The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;Find the sum of all the primes below two million.

(define (chk-prm num p)          ;[chk-prm 6857 2]
  (if (> p (sqrt num))
      0
      (if (= (modulo num p) 0)
          1
          (chk-prm num (+ p 1)))))

(define (fnd n)             ;[fnd 2]
  (define (iter n tot)
    (if (= n 2000000)
      tot
      (if (= (chk-prm n 2) 0)
          (iter (+ n 1) (+ tot n))
          (iter (+ n 1) tot))))
  (iter n 0))

(define fnd1
  (lambda (num)
    (define iter                         ;helper procedure
      (lambda (n tot)
        (cond ((= n num)                 ;ask question
               tot)                      ;if yes, exit
              ((= (chk-prm n 2) 0)        ;ask question
               (iter (+ n 1) (+ tot n)))   ;if yes add to 'tot' and proceed
              (else (iter (+ n 1) tot)))))
    (iter 2 0)))