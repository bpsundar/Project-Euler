;Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
;    1634 = 1^(4) + 6^(4) + 3^(4) + 4^(4)
;    8208 = 8^(4) + 2^(4) + 0^(4) + 8^(4)
;    9474 = 9^(4) + 4^(4) + 7^(4) + 4^(4)
;As 1 = 1^(4) is not a sum it is not included.
;The sum of these numbers is 1634 + 8208 + 9474 = 19316.
;Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

(define (spl num)
  (if (= num 0)
      '()
      (cons (modulo num 10) (spl (quotient num 10)))))
    

(define sq5
  (lambda (n)
    (* n n n n n)))

(define sum5
  (lambda (n)
    (cond ((null? n)
           0)
           (else (+ (sq5 (car n)) (sum5 (cdr n)))))))

(define fnd
  (lambda (n)
    (cond ((> n 1000000)
           '())
          ((= n (sum5 (spl n)))
           (cons n (fnd (+ n 1))))
          (else (fnd (+ n 1))))))

;(fnd 11)
; 4150 4151 54748 92727 93084 194979

