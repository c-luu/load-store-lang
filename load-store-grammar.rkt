#lang brag
stat-list: stat+
stat: lhs '=' rhs
lhs: (indirection | ID)
rhs: (bin-op | indirection | ID)
bin-op: (INT | ID) op (INT | ID)
indirection: '*' '(' ID op ID ')' | '*' ID
op: ('+' | '*') 

