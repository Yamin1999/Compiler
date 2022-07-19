%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
    #include "symtab.c"
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token MAIN INT IF SINGLE DIM AS TO NEXT THEN END_IF ELSE ELSE_IF WHILE FOR CONTINUE BREAK PRINT DOUBLE CHAR 
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token GE LE INC DEC AND
%token <str_val> ID
%token <str_val> STRING
%token <str_val> ICONST
%token <str_val> FCONST
%token <str_val> CCONST

%type<int_val> type constant exp
               

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
            | main
            | loop;

declaration: type ID SEMI
            {
                insert($2,$1);
            }
            |type ID ASSIGN exp SEMI
            {
                           
            if(type_check($1,$4)==-1)
                {                  
                    yyerror();
                    
                }
            else
               {
                insert($2,$1);
               }
            }
            | DIM ID AS type
            {
                insert($2,$4);
            }

            ;

operation: ID ASSIGN exp
            {
                // printf("%d , %d\n",get_type($1),$3);
                if(id_check($1)==-1)
                {
                    printf("%s is not declared\n", $1);
                    yyerror();
                }

                else if(type_check(get_type($1),$3)==-1)
                {
                    yyerror();
                }

            }
          |ID DEC SEMI
          |ID INC SEMI
          |ID ASSIGN operation
          |ID LPAREN STRING RPAREN SEMI
          
          |ID LPAREN ID AND STRING RPAREN
          {
              printf ($3);
              printf ($5);
              printf("\n");
          }
          ;

type: INT {$$=INT_TYPE;}
    | DOUBLE {$$=REAL_TYPE;}
    | CHAR {$$=CHAR_TYPE;}
    | SINGLE {$$=SINGLE_TYPE;}
    ;

exp: ID
    {
        $$ = get_type($1);
    }
    |constant
    {
        $$ = $1;
    }
    |exp ADDOP exp
    {
    
          if(type_check($1,$3)==-1)
        {
            yyerror();
        }
        else 
            $$ = $1;
    }
    |exp SUBOP exp
    |exp MULOP exp
    |exp DIVOP exp
    {             
        if(type_check($1,$3)==-1)
        {
            yyerror();
        }
        else 
            $$ = $1;

    }
    |exp GT exp
    |exp LT exp
    |exp GE exp
    |exp LE exp
    |exp EQUOP exp
    ;

constant: ICONST {$$=INT_TYPE;}
        | FCONST {$$=REAL_TYPE;}
        | CCONST {$$=CHAR_TYPE;}
        ;
main: type MAIN LPAREN RPAREN tail;

loop: FOR ID ASSIGN constant TO constant operation next;

next: NEXT ID;

if_statement: IF operation THEN operation else_statement END_IF;

else_statement: ELSE operation;

tail: LBRACE statements RBRACE;

%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
    // exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
