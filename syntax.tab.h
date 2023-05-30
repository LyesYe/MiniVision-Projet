
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
     token_test_equal = 266,
     token_point = 267,
     token_Tabulation = 268,
     token_From = 269,
     token_Pil = 270,
     token_Image = 271,
     token_Def = 272,
     token_import = 273,
     token_as = 274,
     token_matplotlib = 275,
     token_numpy = 276,
     token_cv2 = 277,
     token_load = 278,
     token_resize = 279,
     token_save = 280,
     token_show = 281,
     token_close = 282,
     token_Open = 283,
     token_Size = 284,
     token_convert = 285,
     token_new = 286,
     token_png = 287,
     token_for = 288,
     token_in_range = 289,
     token_return = 290,
     token_if = 291,
     token_else = 292,
     token_comment = 293,
     token_CST_REAL = 294,
     token_CST_INT = 295,
     token_int = 296,
     token_float = 297,
     token_char = 298,
     token_Final = 299,
     token_string = 300,
     token_idf = 301,
     token_retour = 302,
     token_equal = 303,
     token_sup = 304,
     token_inf = 305,
     token_Mult = 306,
     token_Div = 307,
     token_Pourcentage = 308,
     token_Sub = 309,
     token_Add = 310
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
#line 116 "syntax.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


