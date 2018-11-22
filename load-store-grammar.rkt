#lang brag
stat-list: stat+
stat: lhs '=' rhs
lhs: '*'? ID
rhs: bin-op | offset | lhs
bin-op: primary op primary
offset: '*' '(' ID op ID ')'
op: ('+' | '*') 
primary: INT | ID

