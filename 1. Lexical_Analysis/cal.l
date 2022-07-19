%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    //Roll: 1603007
    //if (variable1 > 10); 
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
{STRING} {printf("%s is STRING\n",yytext);}
"while" { printf("%s is WHILE LOOP\n",yytext);}
"for"   { printf("%s is FOR LOOP\n",yytext);}
"Integer" { printf("%s is INT\n",yytext);}
"double" { printf("%s is DOUBLE\n",yytext); }
"char" { printf("%s is CHAR\n",yytext); }
"Single" { printf("%s is SINGLE\n",yytext); } 
"As" { printf("%s is AS\n",yytext); }
"For" { printf("%s is FOR LOOP\n",yytext); } 


"If" { printf("%s is IF STATEMENT\n",yytext);}
"Else" { printf("%s is ELSE STATEMENT\n",yytext);}
"End If" { printf("%s is END OF IF STATEMENT\n",yytext);}
"Next" { printf("%s is NEXT\n",yytext); }
"Then" { printf("%s is THEN\n",yytext); }  

"+" { printf("%s is ADD\n",yytext); }
"-" { printf("%s is SUB\n",yytext); }
"*" { printf("%s is MUL\n",yytext); }
"/" { printf("%s is DIV\n",yytext); }
"==" { printf("%s is EQUAL\n",yytext); }
">" { printf("%s is GRATER THAN\n",yytext); }
"<" { printf("%s is LESS THAN\n",yytext); }
"&" { printf("%s is AND\n",yytext); } 

"(" { printf("%s is LPAREN\n",yytext); }
")" { printf("%s is RPAREN\n",yytext); }
"{" { printf("%s is LBRACE\n",yytext); }
"}" { printf("%s is RBRACE\n",yytext);; }
";" { printf("%s is SEMI\n",yytext); }
"=" { printf("%s is ASSIGN\n",yytext); }

{ID} { printf("%s is IDENTIFIER\n",yytext);}
{ICONST} { printf("%s is NUMBER\n",yytext);}
{FCONST} { printf("%s is FLOAT\n",yytext);}
{CCONST} { printf("%s is STRING\n",yytext);}
[ \t\r\f]+ 

%%

int yywrap()
{

}

int main()
{
    yylex();
}