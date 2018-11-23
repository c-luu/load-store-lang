#lang racket
(require "load-store-grammar.rkt" "front-end.rkt")

(define(parsed-file file)
    (parse (tokenize (open-input-file file))))

(syntax->datum (parsed-file "src.txt"))
;(generic? (tokenize (open-input-file "src.txt")))
