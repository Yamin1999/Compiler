%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1;
	void yyerror();

	//Roll: 1603007
	//Question 1 : if (variable1 > 10);
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

"Integer"   { return INT; }
"double"    { return DOUBLE; }
"char"		{ return CHAR; }
"float"     { return DOUBLE;}
"void"		{return VOID;}
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
","		  {return COMMA;}
"&"		  {return AND;}

{ID}        { return ID;}
{ICONST}    { return ICONST;}
{FCONST}    { return FCONST;}
{CCONST}    { return CCONST;}
{STRING}	{return STRING;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
