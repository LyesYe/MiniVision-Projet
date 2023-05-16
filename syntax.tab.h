
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     token_ParOuvrante = 258,
     token_ParFermante = 259,
     token_CrochOuvrante = 260,
     token_CrochFermante = 261,
     token_virgule = 262,
     token_gui1 = 263,
     token_gui2 = 264,
     token_Deux_Points = 265,
     token_Final = 266,
     token_test_equal = 267,
     token_Tabulation = 268,
     token_From = 269,
     token_Pil = 270,
     token_Image = 271,
     token_Def = 272,
     token_Open = 273,
     token_Size = 274,
     token_import = 275,
     token_as = 276,
     token_matplotlib = 277,
     token_for = 278,
     token_in_range = 279,
     token_numpy = 280,
     token_if = 281,
     token_else = 282,
     token_comment = 283,
     token_CST_REAL = 284,
     token_CST_INT = 285,
     token_int = 286,
     token_float = 287,
     token_char = 288,
     token_string = 289,
     token_idf = 290,
     token_retour = 291,
     token_point = 292,
     token_cv2 = 293,
     token_equal = 294,
     token_sup = 295,
     token_inf = 296,
     token_Mult = 297,
     token_Div = 298,
     token_Pourcentage = 299,
     token_Sub = 300,
     token_Add = 301
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 13 "syntax.y"

	int entier;
	char* str;
	float reel;




/* Line 1676 of yacc.c  */
#line 107 "syntax.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


