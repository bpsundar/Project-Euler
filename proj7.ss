;By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6^(th) prime is 13.
;What is the 10001^(st) prime number?

(define (chk-prm num p)          ;[chk-prm 6857 2]
  (if (> p (sqrt num))
      0
      (if (= (modulo num p) 0)
          1
          (chk-prm num (+ p 1)))))

(define (fnd n cnt)             ;[fnd 2 0]
  (if (= cnt 10001)
      (- n 1)
      (if (= (chk-prm n 2) 0)
          (fnd (+ n 1) (+ cnt 1))
          (fnd (+ n 1) cnt))))

(define chkprm
  (lambda (num p)
    (cond ((> p (sqrt num))
           0)
          ((= (modulo num p) 0)
           1)
          (else (chkprm num (+ p 1))))))

(define fnd1                    ;(fnd1 2 0)
  (lambda (n cnt)
    (cond ((= cnt 10001)
           n)
          ((= (chkprm n 2) 0)
           (fnd1 (+ n 1) (+ cnt 1)))
          (else (fnd (+ n 1) cnt)))))
      
         