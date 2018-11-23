#lang typed/racket

(define-type EXPR (U CONST IDENT BINOP INDIR))
(define-type STM (U EXPR MOVE))
(define-type BINOP (Pair ARITH (Pair EXPR EXPR)))
(define-type MOVE (Pair EXPR EXPR))
(define-type CONST Integer)
(define-type IDENT String)
(define-type PLUS 1)
(define-type MULT 2)
(define-type STAR 3)
(define-type ARITH (U PLUS MULT))
(define-type INDIR (Pair STAR (U IDENT BINOP)))


