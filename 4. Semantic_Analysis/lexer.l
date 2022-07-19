%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
    #include "symtab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
STRING    ("\"")([A-Za-z]|[0-9]|"="|"<"|">"|(" ")*)*("\"")

%%

"//".*        { } 
"Integer"       { return INT; }
"double"    { return DOUBLE; }
"char"		{ return CHAR; }
"float"     { return DOUBLE;}
"Single" 	{ return SINGLE;} 
"As" 		{ return AS;}
"Dim"		{return DIM;}

"If"		{return IF;}
"Else"		{return ELSE;}
"else if"   {return ELSE_IF;}
"End If" 	{ return END_IF;}
"Next" 		{ return NEXT; }
"Then" 		{ return THEN; }  
"To"        {return TO;}

"while"     {return WHILE;}
"For"		{return FOR;}

"main"      {return MAIN;}

"+"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { return LT; }
">="	  { return GE; }	
"<="	  { return LE; }

"++"	  { return INC;}
"--"	  { return DEC;}

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
"="       { return ASSIGN; }
"&"		  {return AND;}

{ID}        {strcpy(yylval.str_val,yytext); return ID;}
{ICONST}    {strcpy(yylval.str_val,yytext);  return ICONST;}
{FCONST}    {strcpy(yylval.str_val,yytext);  return FCONST;}
{CCONST}    {strcpy(yylval.str_val,yytext);  return CCONST;}
{STRING}    {strcpy(yylval.str_val,yytext); return STRING;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
