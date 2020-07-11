;Find the greatest product of five consecutive digits in the 1000-digit number.

(define (spl1 num i)    ; [spl1 123456 0]
    (- (quotient num (expt 10 i)) (* 10 (quotient num (expt 10 (+ i 1))))))

;(define (fnd num i)
 ; (let ((a (spl1 num i)) (b (spl1 num (+ i 1)))) (- a b)))
  ;(if (- (spl1 num i) (spl1 num (+ i 1))) (spl1 num (+ i 2)) (spl1 num  (+ i 3)) (spl1 num (+ i 4))))      

(define (prod num i)      ;[prod 1234506789 0]
  (* (spl1 num i) (spl1 num (+ i 1)) (spl1 num (+ i 2)) (spl1 num  (+ i 3)) (spl1 num (+ i 4))))      


(define (cns num i b)            ;[cns 1234506789 0 0]
  (if (> i 1000)
      b
      (if (> (prod num i) b)
          (cns num (+ i 1) (prod num i))
          (cns num (+ i 1) b))))
          