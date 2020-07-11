(define (fac n)
  (define (iter p)
    (if (> p (sqrt n))
        '()
        (if (= (modulo n p) 0)
            (cons p (cons (/ n p) (iter (+ p 1))))
            (iter (+ p 1)))))
  (iter 1))

(define (chk-prm num)             ;[chk-prm 6857 2]
  (define (iter p) 
    (if (> p (sqrt num))
        0                          ;[write 'prime]
        (if (= (modulo num p) 0)
            1                        ;[write 'not-prime]
            (iter (+ p 1)))))
  (iter 2))
(define (filt seq)
  (cond ((null? seq) '())
        ((if (= (chk-prm (car seq)) 0)
         (cons (car seq) (filt (cdr seq)))
         (filt (cdr seq))))))
(define (prmfac n)                   ;(prmfac 600851475143)
  (filt (fac n)))
