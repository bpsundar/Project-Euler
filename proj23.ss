;A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
;For example, the ;sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
;which means that 28 is a perfect number.
;A number n is called deficient if the sum of its proper divisors is less than n and it is called 
;abundant if this sum exceeds n.
;As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
;Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

(define (fac-sum n)
  (define (iter c sum)
    (if (>= c (sqrt n))
        (+ 1 sum)
        (if (= (modulo n c) 0)
            (iter (+ c 1) (+ c (/ n c) sum))
            (iter (+ c 1) sum))))
  (iter 2 0))

(define x '())
(define (sum)
  (define (iter n x)
    (if (> n 20161)
        (total x 1 0)
        (if (> (fac-sum n) n)
            (iter (+ n 1) (append x (cons n '())))
            (iter (+ n 1) x))))
  (iter 2 x))
(define y '())
(define (chk x f n) 
  (cond ((null? x) 1)
        ((> (+ f (car x)) n) 1)
        ((= (+ f (car x)) n) 0)
        (else (chk (cdr x) f n))))

(define (chk1 x n)
  (if (null? x)
      1
      (if (> (+ (car x) (car x)) n)
          1
          (if (= (chk x (car x) n) 1)
              (chk1 (cdr x) n)
              0))))
                                        
(define (total x n tot)
  (if (> n 20161)
      tot
      (total x (+ n 1) (+ tot (* n (chk1 x n))))))
(define x'(12 18 20 24 30 36 40 42 48 54 56 60 66 70 72 78 80 84 88 90 96 100))

  

      
  
        

                

  
        