;The prime 41, can be written as the sum of six consecutive primes:
;41 = 2 + 3 + 5 + 7 + 11 + 13
;This is the longest sum of consecutive primes that adds to a prime below one-hundred.
;The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
;Which prime, below one-million, can be written as the sum of the most consecutive primes?

;answer for number below 100,000 : 183 terms = 92951
;answer for 1,000,000 : 958577 : 536 terms
;                       920291 : 525 terms
;                       978037 : 539 terms
;                       997651 : 543 terms

(define gen                         ;(gen 100 2)
  (lambda (n i)
    (cond ((< n 2)
           '())
          ((> i (sqrt n))
           (cons n (gen (- n 1) 2)))
          ((= (modulo n i) 0)
           (gen (- n 1) 2))
          (else (gen n (+ i 1))))))

(define l (reverse (gen 1000000 2)))
          

(define membr                    ;(membr 41 (gen 100 2))
  (lambda (n l)
    (cond ((null? l)
           0)
          ((eq? n (car l))
           n)
          (else (membr n (cdr l))))))


(define add                      ;(add (gen 10 2) 0)
  (lambda (l tot)
    (cond ((null? l)
           '())
          (else (cons (+ tot (car l)) (add (cdr l) (+ tot (car l))))))))



(define fnd                      ;(fnd (cdr (cdr (cdr l))))
  (lambda (l)
    (define oaddl 0)
    (set! oaddl (add l 0))
    (define iter
      (lambda (al b i)
        (cond ((null? al)
               (cons b (cons i '())))
              ((< b (membr (car al) l))
               (iter (cdr al) (car al) (fnd-cnt (car al) oaddl 0)))
              (else (iter (cdr al) b i)))))
(iter oaddl 0 0)))

(define fnd-cnt                    ;(fnd-cnt 41 (add l 0) 0)
  (lambda (n l i)
    (cond ((> (membr n l) 0)
           (cond ((eq? n (car l))
                  (+ i 1))
                 (else (fnd-cnt n (cdr l) (+ i 1)))))
          (else 0))))

(define fnd-all                 ;(fnd-all l 0)
  (lambda (l b)
    (define lsbg 0)
    (set! lsbg (fnd l))
    
    (cond ((null? l)
           (cons b '()))
          ((< b (car (cdr lsbg)))
           (cons (car lsbg) (fnd-all (cdr l) (car (cdr lsbg)))))
          (else (fnd-all (cdr l) b)))))
           

           
          
           

