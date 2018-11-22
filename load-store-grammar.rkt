#lang brag
stat-list: ((indirection | ID) '=' (bin-op | indirection | ID))+
bin-op: (INT | ID) op (INT | ID)
indirection: '*' '(' ID op ID ')' | '*' ID
op: ('+' | '*') 

