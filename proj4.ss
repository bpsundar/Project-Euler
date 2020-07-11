;A palindromic number reads the same both ways.
;The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
;Find the largest palindrome made from the product of two 3-digit numbers.

(define (st n1 n2)               ; plaindrome [st 101 999]
  (if (= (cmp (* n1 n2)) 0)
      (if (< n2 100)
          (write 'end)
          (and (and (write n1) (write '*) (write n2) (write '=) (write (* n1 n2)) (newline)) (st n1 (- n2 1))))
      (if (> n1 999) 
          (st 101 (- n2 1))
          (st (+ n1 1) n2))))            
              
(define (cmp pldrom)
  (if (equal? (spl pldrom) (reverse (spl pldrom)))
      0
      1))
          
(define (spl num)
    (define (iter i num)
      (if (= num 0)
          '()
      (cons (modulo num 10) (iter i (quotient num 10)))))
    (iter 1 num))

