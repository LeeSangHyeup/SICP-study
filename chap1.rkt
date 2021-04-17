#lang planet neil/sicp

; 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

; 1.3
(define (square a)
  (* a a))
(define (sum-of-square a b)
  (+ (square a) (square b)))
(define (min a b)
  (if (> a b)
      b
      a))
(define (min3 a b c)
  (min a (min b c)))
(define (sum-of-square-of-top2 a b c)
  (cond ((= (min3 a b c) a) (sum-of-square b c))
        ((= (min3 a b c) b) (sum-of-square a c))
        ((= (min3 a b c) c) (sum-of-square a b))
  ))

; 1.4
; if절의 연산가 먼저 계산되어 (+혹은- a b)의 형태가 되고
; b의 연산자에 부호 +나 -가 곱해진 다음, a에 더해지는 순서로 계산됨
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; 1.5