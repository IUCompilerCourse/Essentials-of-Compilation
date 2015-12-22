#lang racket
(require racket/match)
(require racket/fixnum)

(define assert
  (lambda (msg b)
    (if (not b)
	(begin
	  (display "ERROR: ")
	  (display msg)
	  (newline))
	(void))))

(define ast1.4 `(- 8))
(define ast1.1 `(+ 50 ,ast1.4))

(match ast1.1
  [`(,op ,child1 ,child2)
    (print op) (newline)
    (print child1) (newline)
    (print child2)])

(define (arith-kind arith)
  (match arith
    [(? fixnum?) `int]
    [`(- ,c1) `neg]
    [`(+ ,c1 ,c2) `add]))

(arith-kind `50)
(arith-kind `(- 8))
(arith-kind `(+ 50 (- 8)))

(define (arith? sexp)
  (match sexp
    [(? fixnum?) #t]
    [`(+ ,e1 ,e2)
     (and (arith? e1) (arith? e2))]
    [`(- ,e) (arith? e)]
    [else #f]))

(arith? `(+ 50 (- 8)))
(arith? `(- 50 (+ 8)))

(define (interp-arith e)
  (match e
    [(? fixnum?) e]
    [`(read)
     (let ([r (read)])
       (cond [(fixnum? r) r]
             [else (error 'interp-arith "input was not an integer" r)]))]
    [`(- ,e)
     (fx- 0 (interp-arith e))]
    [`(+ ,e1 ,e2)
     (fx+ (interp-arith e1) (interp-arith e2))]
    ))

(interp-arith ast1.1)
;(interp-arith `(+ (read) (- 8)))

(define (pe-neg r)
  (match r
    [(? fixnum?) (fx- 0 r)]
    [else `(- ,r)]
    ))

(define (pe-add r1 r2)
  (match (list r1 r2)
    [`(,n1 ,n2)
     #:when (and (fixnum? n1) (fixnum? n2))
     (fx+ r1 r2)]
    [else
     `(+ ,r1 ,r2)]
    ))

(define (pe-arith e)
  (match e
    [(? fixnum?) e]
    [`(read)
     `(read)]
    [`(- ,e1)
     (pe-neg (pe-arith e1))]
    [`(+ ,e1 ,e2)
     (pe-add (pe-arith e1) (pe-arith e2))]
    ))

;; e ::= (read) | (- (read)) | (+ e e)
;; r ::= n | (+ n e) | e

(define (pe-neg2 r)
  (match r
    [(? fixnum?) (fx- 0 r)]
    [`(+ ,n ,e2)
     #:when (fixnum? n)
     `(+ ,(fx- 0 n) ,(pe-neg2 e2))]
    [`(read) `(- (read))]
    [`(- ,e2) e2]
    [`(+ ,e1 ,e2)
     `(+ ,(pe-neg2 e1) ,(pe-neg2 e2))]
    ))

(define (pe-add2 r1 r2)
  (match r1
    [(? fixnum?)
     (match r2
       [(? fixnum?) (fx+ r1 r2)]
       [`(+ ,n2 ,e2) #:when (fixnum? n2)
        `(+ ,(fx+ r1 n2) ,e2)]
       [else `(+ ,r1 ,r2)])]
    [`(+ ,n1 ,e1)
     (match r2
       [(? fixnum?) `(+ (fx+ n1 r2) ,e1)]
       [`(+ ,n2 ,e2) #:when (fixnum? n2)
        `(+ ,(fx+ n1 n2) (+ ,e1 ,e2))]
       [else `(+ ,r1 ,r2)])]
    [else
     (match r2
       [(? fixnum?) `(+ ,r2 ,r1)]
       [else `(+ ,r1 ,r2)])]
    ))

(define (pe-arith2 e)
  (match e
    [(? fixnum?) e]
    [`(read)
     `(read)]
    [`(- ,e1)
     (pe-neg2 (pe-arith2 e1))]
    [`(+ ,e1 ,e2)
     (pe-add2 (pe-arith2 e1) (pe-arith2 e2))]
    ))


(define (test-pe pe p)
  (assert "testing pe-arith" (equal? (interp-arith p)
                                     (interp-arith (pe p)))))

(test-pe pe-arith `(+ (read) (- (+ 5 3))))
(test-pe pe-arith `(+ 1 (+ (read) 1)))
(test-pe pe-arith `(- (+ (read) (- 5))))

(test-pe pe-arith2 `(+ (read) (- (+ 5 3))))
(test-pe pe-arith2 `(+ 1 (+ (read) 1)))
(test-pe pe-arith2 `(- (+ (read) (- 5))))
