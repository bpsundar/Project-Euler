;The prime factors of 13195 are 5, 7, 13 and 29
;What is the largest prime factor of the number 600851475143

(define (sq x) (* x x))

(define (fst-pwr b n)                       ;[fst-pwr 2 1000]
  (define (iter b n prod)
    (if (= n 0)
        prod
        (if (= (modulo n 2) 0)
            (iter (sq b) (/ n 2) prod)
            (iter b (- n 1) (* b prod)))))
  (iter b n 1))

(define (fermat-tst n)                       ;[fermat-tst 561] [1105 1729 6857]
  (define (iter a t)
    (if (> t 0)
        (if (= (remainder (fst-pwr a (- n 1)) n) (modulo 1 n))
            (iter (+ 1 (random (- n 1))) (- t 1))
            1) ;(write 'not-prime))
        0)) ;(write 'prime)))
  (iter (+ 1 (random (- n 1))) 10))

;(define (fermat-tst n)
;  (define (iter a t)
;    (if (> t 0)
;        (if (= (remainder (fst-pwr a n) n) a)
;            (iter (+ 1 (random (- n 1))) (- t 1))
;            (write 'not-prime))
;        (write 'prime)))
;  (iter (+ 1 (random (- n 1))) 10))
    
(define (facs? n)                    ;(facs? 600851475143)
    (define l '())
    (define (iter p l)
      (if (> p (sqrt n))
          (fltr l)             ;substitute this line with 'l' for list of factors
          (if (= (modulo n p) 0)
              (if (= (modulo (- p 1) 2) 0)         ;eliminate the need to check even numbers
                  (iter (+ p 2) (cons p l))
                  (iter (+ p 1) (cons p l)))
              (if (= (modulo (- p 1) 2) 0)
                  (iter (+ p 2) l)
                  (iter (+ p 1) l)))))
    (iter 2 l))

(define (fltr l)
  (if (eq? l '())
      l
      (hlp-fltr (car l) (cdr l) l)))

(define (hlp-fltr f r l)
    (if (eq? r '())
        (cons f (fltr (cdr l)))
        (if (= (modulo f (car r)) 0) 
            (fltr (cdr l))
            (hlp-fltr f (cdr r) l))))

(define my-lst                   ; (fltr (my-lst 100))
    (lambda (n)
      (cond ((= n 1)
             '())
            ((cons n (my-lst (- n 1)))))))
          