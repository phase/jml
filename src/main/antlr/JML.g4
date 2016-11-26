grammar JML;

/*
This is the grammar for Jadon's ML.
It is somewhat based off https://people.mpi-sws.org/~rossberg/sml.html
*/

module
    : 'with' ID
    | declaration+
    ;

expression
    : constant
    | expression expression // application
    | '(' expression ')'
    | '(' expression (',' expression)+ ')' // tuple
    | '[' expression (',' expression)* ']' // list
    | '(' expression (';' expression)+ ')' // sequence
    | 'if' expression 'then' expression 'else' expression
    | 'while' expression 'do' expression
    | 'case' expression 'of' match
    | expression ':' type
    ;

match
    : pattern '=>' expression ('|' match)?
    ;

pattern
    : constant
    | '_' // wildcard
    | '(' pattern ')'
    | '(' pattern (',' pattern)+ ')' // tuple
    | pattern ':' type
    ;

type
    : ID
    | '(' type ')'
    | type '->' type // function
    | type ('*' type)+ // tuple
    ;

declaration
    : declaration ';' declaration // sequence
    | 'let' ID '=' expression // binding
    | 'let' ID ID+ '=' declaration* expression // function
    | 'type' ID '=' type // type
    ;

constant
    : INT
    | STRING
    ;

fragment DIGIT: '0'..'9';
INT: '-'? DIGIT+;

STRING: '"' (~[\\"])*? '"';

fragment LETTER: [a-zA-Z];
ID: LETTER (LETTER | DIGIT | '_' | '\'')*;
