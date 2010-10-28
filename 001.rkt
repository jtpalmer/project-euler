#lang racket

(define (want-number num)
  (cond [(= (modulo num 3) 0) #t]
        [(= (modulo num 5) 0) #t]
        [else #f]))

(define (my-sum start limit)
  (cond [(= start limit) 0]
        [else (+ (cond [(want-number start) start]
                       [else 0])
                 (my-sum (+ start 1) limit))]))

(my-sum 1 1000)
