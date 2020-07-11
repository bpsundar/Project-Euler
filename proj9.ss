;A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;a^(2) + b^(2) = c^(2)
;For example, 3^(2) + 4^(2) = 9 + 16 = 25 = 5^(2).
;There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;Find the product abc.

(define sq
  (lambda (x)
    (* x x)))

(define fnd                           ;(fnd 2 2 2)
  (lambda (a b c)
    (cond ((= (+ a b c) 1000)                  ;ask question
           (cond ((= (+ (sq a) (sq b)) (sq c))   ;ask question
                  (and (write a) (write 'x) (write b) (write 'x) (write c) (write '=) (* a b c)))  ;answer and exit
                 (else (inc a b c))))        ;increment the values 
          (else (inc a b c)))))              ;increment the values

(define inc
  (lambda (a b c)
    (cond ((< c (- 1000 (+ a b)))        ;ask question to check "c" reached it's limit
           (fnd a b (+ c 1)))            ;increment "c" and proceed  a=2;b=2;c=2,3,4,5,6...996
          (else (incb a (+ b 1) 2)))))   ;if "c" reached it's limit, reset "c" and increment "b"  a=2;b=3,4,5,6...996;c=2

(define incb
  (lambda (a b c)
    (cond ((< b (- 1000 (+ a c)))        ;ask question to check "b" reached it's limit
           (fnd a b c))                  ;proceed
          (else (fnd (+ a 1) 2 2)))))    ;if "b" reached it's limit, increment "a" and reset "b" and "c"   a=3,4,5,6...996;b=2;c=2