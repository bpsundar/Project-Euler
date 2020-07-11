;If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;The sum of these multiples is 23.
;Find the sum of all the multiples of 3 or 5 below 1000.


(define chk
  (lambda (num l)
  (cond ((null? l)
         1)
        ((= (modulo num (car l)) 0)
         0)
        (#t (chk num (cdr l))))))

(define sum1                       ;(sum1 9 0)
  (lambda (n tot)
        (cond ((= n 0) 
             tot)
            ((or (= (modulo n 3) 0) (= (modulo n 5) 0))
             (sum1 (- n 1) (+ tot n)))
            (else (sum1 (- n 1) tot)))))

(define my-lst
  (lambda (num l)
    (cond ((= num 0)
           '())
          ((= (chk num l) 0)
           (cons num (my-lst (- num 1) l)))
          (else (my-lst (- num 1) l)))))

(define fnd                     ;(fnd 999 '(3 5))
  (lambda (n l)
    (foldl + 0 (my-lst n l))))

;233168

  
            
                            
                              
            
          
          
  
