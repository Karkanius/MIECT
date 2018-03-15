grammar Calculator ;
program : stat* EOF ;
stat : expr NEWLINE
     | NEWLINE ;
expr : expr ( '*' | '/' ) expr      // Alternativa mais prioritária
     | expr ( '+' | '-' ) expr
     | INT
     | '(' expr ')'                 // Alternativa menos prioritária
     ;
INT : [0-9]+ ;                      // INT é composto por um ou mais algarismos
NEWLINE : '\r'? '\n' ;              // '\r' é opcional
WS: [ \t]+ -> skip ;
