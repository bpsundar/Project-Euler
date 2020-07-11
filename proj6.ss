;The sum of the squares of the first ten natural numbers is,
;1^(2) + 2^(2) + ... + 10^(2) = 385
;The square of the sum of the first ten natural numbers is,
;(1 + 2 + ... + 10)^(2) = 55^(2) = 3025
;Hence the difference between the sum of the squares of the first ten natural numbers 
;and the square of the sum is 3025 − 385 = 2640.
;Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

(define (sq x)
  (* x x))

(define (sum x)
  x)

(define (su num fn)          ;[sum 100 fn] fn-is either the procedure [sum] or [sqsum] 
  (define (iter num tot)
    (if (= num 0)
      tot
      (iter (- num 1) (+ tot (fn num)))))
  (iter num 0))

(define (diff num)                 ; [diff 100]
  (- (sq (su num sum)) (su num sq)))

;(define (map f my-list)
;  (if (empty? my-list) empty
;      (cons (f (first my-list))
;            (map f (rest my-list)))))

;(define (fold f val my-list)
;  (if (empty? my-list) val
;      (fold f
;            (f val (first my-list))
;            (rest my-list))))

  
(define my-list
  (lambda (n)
    (cond ((= n 0)
           '())
          (else (cons n (my-list (- n 1)))))))

(define diff1
  (lambda (n)
    (- (sq (foldl + 0 (my-list n))) (foldl + 0 (map sq (my-list n))))))
    



