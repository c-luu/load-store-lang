#lang brag
reg: op ID ID ;; cost = 1
reg: op ID INT ;; cost = 2
reg: '*' ID ;; cost = 3
addr: ID ;; cost = 2
addr: '*' ID ;; cost = 4
addr: '*' op ID ID ;; cost = 5
op: ('+' | '*') 
