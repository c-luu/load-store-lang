#lang brag
load-store: lhs "=" rhs load-store*
lhs: val | OPERAND
rhs: bin-op | lhs
val: "*" OPERAND
bin-op: OPERAND ("+" | "*") OPERAND

