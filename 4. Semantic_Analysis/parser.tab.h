/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    MAIN = 258,                    /* MAIN  */
    INT = 259,                     /* INT  */
    IF = 260,                      /* IF  */
    SINGLE = 261,                  /* SINGLE  */
    DIM = 262,                     /* DIM  */
    AS = 263,                      /* AS  */
    TO = 264,                      /* TO  */
    NEXT = 265,                    /* NEXT  */
    THEN = 266,                    /* THEN  */
    END_IF = 267,                  /* END_IF  */
    ELSE = 268,                    /* ELSE  */
    ELSE_IF = 269,                 /* ELSE_IF  */
    WHILE = 270,                   /* WHILE  */
    FOR = 271,                     /* FOR  */
    CONTINUE = 272,                /* CONTINUE  */
    BREAK = 273,                   /* BREAK  */
    PRINT = 274,                   /* PRINT  */
    DOUBLE = 275,                  /* DOUBLE  */
    CHAR = 276,                    /* CHAR  */
    ADDOP = 277,                   /* ADDOP  */
    SUBOP = 278,                   /* SUBOP  */
    MULOP = 279,                   /* MULOP  */
    DIVOP = 280,                   /* DIVOP  */
    EQUOP = 281,                   /* EQUOP  */
    LT = 282,                      /* LT  */
    GT = 283,                      /* GT  */
    LPAREN = 284,                  /* LPAREN  */
    RPAREN = 285,                  /* RPAREN  */
    LBRACE = 286,                  /* LBRACE  */
    RBRACE = 287,                  /* RBRACE  */
    SEMI = 288,                    /* SEMI  */
    ASSIGN = 289,                  /* ASSIGN  */
    GE = 290,                      /* GE  */
    LE = 291,                      /* LE  */
    INC = 292,                     /* INC  */
    DEC = 293,                     /* DEC  */
    AND = 294,                     /* AND  */
    ID = 295,                      /* ID  */
    STRING = 296,                  /* STRING  */
    ICONST = 297,                  /* ICONST  */
    FCONST = 298,                  /* FCONST  */
    CCONST = 299                   /* CCONST  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "parser.y"

    char str_val[100];
    int int_val;

#line 113 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
