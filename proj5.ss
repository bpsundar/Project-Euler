;2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
;What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

(define (sml n m num)        ;[sml 2 20 20]
  (if (= (fac n m num) 0)    
      (sml  n m (+ num 20))
      num))

(define (fac n m num)
  (if (= (modulo num n) 0)
      (if (>= n m)
          num
          (fac (+ n 1) m num)) 
      0))