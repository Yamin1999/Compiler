%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
	extern int lineno;
	extern int yylex();
%}
%token INT SINGLE DIM IF ELSE ELSE_IF END_IF NEXT THEN WHILE FOR CONTINUE BREAK TO PRINT DOUBLE CHAR STRING VOID
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT AS
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token GE LE INC DEC COMMA AND
%token ID
%token ICONST
%token FCONST
%token CCONST

%right ASSIGN
%left LT GT GE LE
%left EQUOP
%left ADDOP SUBOP 
%left MULOP DIVOP



%start code

%%
code: statements;

statements: statements statement | ;

statement:    declaration
            | if_statement
            | operation
            | function
            | loop;

declaration: type ID SEMI
            |type ID ASSIGN exp SEMI
            |DIM ID AS type
            ;

operation: ID ASSIGN exp
          |ID DEC SEMI
          |ID INC SEMI
          |ID ASSIGN operation
          |ID LPAREN STRING RPAREN SEMI
          |ID LPAREN ID AND STRING RPAREN
          ;

type: INT 
    | DOUBLE 
    | CHAR
    | VOID
    | SINGLE 
    ;

exp: ID
    |constant
    |exp ADDOP exp
    |exp SUBOP exp
    |exp MULOP exp
    |exp DIVOP exp
    |exp GT exp
    |exp LT exp
    |exp GE exp
    |exp LE exp
    |exp EQUOP exp
    |LPAREN exp RPAREN
    ;

constant: ICONST 
        | FCONST 
        | CCONST 
        ;
parameters: parameters parameter | ;

parameter: type ID COMMA
         | type ID
         ;
         
function: type ID LPAREN parameters RPAREN tail;

loop: FOR ID ASSIGN constant TO constant operation NEXT ID;

if_statement: IF operation THEN operation else_statement END_IF;


else_statement: ELSE operation;

tail: LBRACE statements RBRACE;


%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
