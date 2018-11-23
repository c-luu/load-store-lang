#lang typed/racket
(provide all-defined-out)

(define-type EXPR (U CONST IDENT BINOP INDIR ESEQ))
(define-type INDIR (U IDENT BINOP))
(define-type STM (U MOVE SEQ))
;; ESEQ + SEQ may not be needed.
(define-type ESEQ (Pair STM EXPR))
(define-type SEQ (Pair STM STM))
; Pair: use cdr and car.
(define-type BINOP (Pair ARITH (Pair EXPR EXPR)))
(define-type MOVE (Pair EXPR EXPR))
(define-type CONST Integer)
(define-type IDENT String)
(define-type PLUS 1)
(define-type MULT 2)
(define-type ARITH (U PLUS MULT))


