#lang racket/base
(require brag/support br-parser-tools/lex syntax/parse "types.rkt")
(provide tokenize)

(define (tokenize ip)
  (port-count-lines! ip)
    (define lexer
      (lexer-src-pos
        [(repetition 1 +inf.0 numeric)
         (token 'INT (string->number lexeme))]
        [(:: (:+ (char-range #\a #\z)) 
             (:* (char-range #\0 #\9)))
         (token 'ID lexeme)]
        ["="
         (token "=" lexeme)]
        ["*"
         (token "*" lexeme)]
        ["+"
         (token "+" lexeme)]
        ["("
         (token "(" lexeme)]
        [")"
         (token ")" lexeme)]
        [whitespace
         (token 'WHITESPACE lexeme #:skip? #t)]
        ["\n"
         (token 'NEWLINE lexeme #:skip? #t)]
        [(eof)
         (void)]))
    (define (next-token) (lexer ip))
    next-token)

(define (interp-stat-list stat-list-stx)
  (syntax-parse stat-list-stx
    [({~literal stat-list} stat-stxs ...)
     (for ([stat-stx (syntax->list #'(stat-stxs ...))])
       (interp-stat stat-stx))]))

(define (interp-stat stat-stx)
  (new MOVE
   (syntax-parse stat-stx
     [({~literal lhs} lhs-stxs ...)
      (interp-lhs lhs-stxs)])
   (syntax-parse stat-stx
     [({~literal rhs} rhs-stxs ...)
      (interp-rhs rhs-stxs)])))
    