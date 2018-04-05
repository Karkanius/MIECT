grammar Numbers ;
file  : line* EOF ;
line  : NUM '-' WORD NUL ;
NUM   : [0-9]+ ;
WORD  : [A-Za-z]+ ;
NL    : '\r'? '\n' ;
WS    : [ \t]+ -> skip ;
