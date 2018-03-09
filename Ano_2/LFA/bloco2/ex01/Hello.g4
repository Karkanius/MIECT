grammar Hello ;			// Define a grammar called Hello
greetings : 'hello' ID ;		// match a keyword hello followed by an identifier
ID : [a-z]+ ;			// match lower-case identifier
WS : [ \t\r\n]+ -> skip ;	// skip spaces, tabs, newlines, \r (Windows)
