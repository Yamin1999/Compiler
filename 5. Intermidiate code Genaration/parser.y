%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	void yyerror();
    #include "symtab.c"
    #include "CodeGen.h"
	extern int lineno;
	extern int yylex();

        typedef struct temp_value
    {
        int int_value;
        double double_value;
        char char_value;
        int type;

    }temp_value;
%}


%union
{
    char str_val[100];
    int int_val;
    double double_val;
    temp_value* temp_val;

}

%token MAIN INT IF ELSE ELSE_IF WHILE FOR CONTINUE BREAK PRINT DOUBLE CHAR STRING
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token GE LE INC DEC 
%token <str_val> ID
%token <str_val> ICONST
%token <str_val> FCONST
%token <str_val> CCONST

%type<int_val> type statement
%type<int_val> constant exp

%right ASSIGN
%left LT GT GE LE
%left EQUOP
%left ADDOP SUBOP
%left MULOP DIVOP


%start program

%%
program: {gen_code(START,-1);} code {printf("halt\n");};

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

            ;

operation: ID ASSIGN exp SEMI
            {
                if(id_check($1)==-1)
                {
                    printf("%s is not declared\n", $1);
                    yyerror();
                }

                if(type_check(get_type($1),$3)==-1)
                {
                    yyerror();
                }

            }
          |ID DEC SEMI
          |ID INC SEMI
          |ID ASSIGN operation
          ;

type: INT {$$=INT_TYPE;}
    | DOUBLE {$$=REAL_TYPE;}
    | CHAR {$$=CHAR_TYPE;};

exp: ID
    {
        $$ = get_type($1);
    }
    |constant
    |exp ADDOP exp
    {

        
        if(type_check($1,$3)==-1)
        {
            yyerror();
        }
        else 
            $$ = type_check($1,$3);
    }
    |exp SUBOP exp
    |exp MULOP exp
    |exp DIVOP exp
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

loop: WHILE LPAREN exp RPAREN tail
     |FOR LPAREN operation exp SEMI RPAREN tail;

if_statement: IF LPAREN exp RPAREN tail else_if_statement else_statement;

else_if_statement: ELSE_IF LPAREN exp RPAREN tail | ;

else_statement: ELSE tail | ;

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
    printf("\n\n================STACK MACHINE INSTRUCTIONS================\n");
    print_code();
	
    return 0;
}
