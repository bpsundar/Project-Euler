(define (enu-int low high)
  (if (> low high)
      '()
      (cons low (enu-int (+ low 1) high))))
(define (accu op initial seq)
  (define (iter op initial seq tot)
    (if (null? seq)
        tot 
        (iter op initial (cdr seq) (op initial (car seq) tot))))
  (iter op initial seq 0))
(define (my-filt pred seq)
  (cond ((null? seq) '())
        ((pred (car seq)) (cons (car seq) (my-filt pred (cdr seq))))
        (else (my-filt pred (cdr seq)))))
(define (filt35 seq)
  (cond ((null? seq) '())
        ((or (= (modulo (car seq) 3) 0) (= (modulo (car seq) 5) 0))
         (cons (car seq) (filt35 (cdr seq))))
        (else (filt35 (cdr seq)))))         
(define (sum35 n)                   ;[sum35 999]
  (accu + 0 (filt35 (enu-int 0 n))))

(define (fib n)
  (define (iter a b cnt)
    (if (> a n)
      '()
      (cons a (iter b (+ a b) (+ cnt 1)))))
  (iter 0 1 0))
(define (even-fib n)                 ;[even-fib 4000000]
  (accu + 0 (my-filt even? (fib n))))

        