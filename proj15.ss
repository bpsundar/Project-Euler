(define (fac n)
  (if (= n 0)
      1
      (* n (fac (- n 1)))))
(define (grid n)
  (/ (fac (* 2 n)) (* (fac n) (fac n))))

(define (pascal r c)
  (cond ((= c 0) 1)
        ((= c r) 1)
        (else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))))
  