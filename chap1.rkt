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
; b에 연산자 +나 -가 곱해진 다음, a에 더해지는 순서로 계산됨
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; 1.5
; #정의대로 계산하는 실행기 사용시
; 주어지는 인자 X의 값에 따라서 무한루프에 빠질수도, 0이 반환될 수도 있다.
; - 

; #인자 먼저 계산하는 실행기 사용시
; test의 인자로 어떤 값이 주어지는지 여부에 상관없이 무한루프에 빠진다.
; - 인자 (p)가 호출되면 무한루프인데 이 값을 먼저 계산하므로.
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))

; 1.6
; new-if문 안에서는 술어만 먼저 실행이 되고 그 결과에 따라 then, else중 하나만 수행이 되어야 하는데
; new-if가 일반함수라면, 호출시에 술어와 then, else를 모두 실행하므로, else절에서의 sqrt-iter호출이 무한반복됨.
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average  guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  ;(new-if (good-enough? guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; 1.7
; 문제가 무슨 말인지 이해가 가지않음...
(define (cube-improve guess x)
  (/ ( + (/ x (square guess)) (* 2 guess)) 3))

(define (sqrt-iter3 guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter3 (cube-improve guess x)
                 x)))
(define (cube-root x)
  (sqrt-iter3 1.0 x))

; 문제 1.9
; 첫번째 프로시저는 재귀함수가 호출되어도 (inc) 프로시저가 남아 있으므로, 재귀함수가 호출될 때마다 계산거리가
; 계속누적되어서 되도는 프로세스임.(꼬리재귀 조건을 불만족)


; 두번째 프로시저는 재귀함수의 호출이 함수의 마지막 문장이고, 호출될 때 재귀함수의 모든 인자가 계산된 후에 호출되므로
; 반복하는 프로세스임(꼬리재귀의 조건을 충족)
(define (plus a b)
  (define (dec x)
    (- x 1))
  (define (inc x)
    (+ x 1))
  (if (= a 0)
      b
      (plus (dec a) (inc b))))

; 문제 1.10


          