
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "syntax.tab.h"


extern int nb_col= 1,nb_ligne=1;
int cur_line_tab = 0;   /* indentation of the current line */
int tab_level = 0;          /* indentation level passed to the parser */
%}



lettreMin [a-z]
lettreMaj [A-Z]
letter {lettreMin}|{lettreMaj}
chiffre [0-9]
CST_REAL \([+-]{chiffre}+\.{chiffre}+\)|{chiffre}+\.{chiffre}+
CST_INT \([+-]{chiffre}+\)|{chiffre}+
charctereSpecial [_]
comment ("#"(.)*)

IDF {letter}({letter}|{chiffre}|{charctereSpecial})*


indent ^[ \t]+

%%


{indent} { printf("\n ** Indent \n"); cur_line_tab++; nb_col += yyleng; }




"("                         {printf("\n Sep_ParOuvrante reconnu \n"); nb_col += yyleng;             find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_ParOuvrante);}
")"                         {printf("\n Sep_ParFermante reconnu \n"); nb_col += yyleng;             find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_ParFermante);}
"["                         {printf("\n Sep_CrochOuvrante reconnu \n"); nb_col += yyleng;           find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_CrochOuvrante);}
"]"                         {printf("\n Sep_CrochFermante reconnu \n"); nb_col += yyleng;           find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_CrochFermante);}
","                         {printf("\n Sep_virgule reconnu \n"); nb_col += yyleng;                 find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_virgule);}
"'"                         {printf("\n Sep_gui1 \n"); nb_col += yyleng;                            find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_gui1); }
["]                         {printf("\n Sep_gui2 \n"); nb_col += yyleng;                            find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_gui2);  }
":"                         {printf("\n Sep_Deux_Points reconnu \n"); nb_col += yyleng;             find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Deux_Points);}
"%"                         {printf("\n Sep_Pourcentage reconnu \n"); nb_col += yyleng;             find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Pourcentage);}
"+"                         {printf("\n Sep_Add reconnu \n"); nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Add);}
"="                         {printf("\n Sep_equal reconnu \n"); nb_col += yyleng;                   find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_equal);}
"=="                        {printf("\n Sep_double_equal reconnu \n"); nb_col += yyleng;            find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_test_equal);      }
"-"                         {printf("\n Sep_Sub reconnu \n"); nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Sub);}
"*"                         {printf("\n Sep_Mult reconnu \n"); nb_col += yyleng;                    find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Mult);}
"/"                         {printf("\n Sep_Div reconnu \n"); nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Div);}
[\t]                        {printf("\n Sep_tab reconnu \n"); nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Tabulation);}
"from"                      {printf("\n Mc_from reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_From);}
"final"                     {printf("\n Mc_from reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Final);}
"PIL"                       {printf("\n Mc_PIL reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Pil);}
"cv2"                       {printf("\n Mc_cv2 reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_cv2);}
"Image"                     {printf("\n Mc_Image reconnu \n");nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Image);}
"def"                       {printf("\n Mc_def reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Def);}
"open"                      {printf("\n Mc_open reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Open);} 
"size"                      {printf("\n Mc_size reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_Size);}
"load"                      {printf("\n Mc_load reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_load);}
"resize"                      {printf("\n Mc_resize reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_resize);}
"save"                      {printf("\n Mc_save reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_save);}
"show"                      {printf("\n Mc_show reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_show);}
"close"                      {printf("\n Mc_close reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_close);}
"convert"                      {printf("\n Mc_convert reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_convert);}
"new"                      {printf("\n Mc_new reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_new);}
"png"                      {printf("\n Mc_png reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_png);}
"<"                         {printf("\n Mc_inf reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_inf);}
">"                         {printf("\n Mc_sup reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_sup);}
"import"                    {printf("\n Mc_import reconnu \n");nb_col += yyleng;                    find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_import);}
"as"                        {printf("\n Mc_as reconnu \n");nb_col += yyleng;                        find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_as);}
"matplotlib.pyplot"         {printf("\n Mc_matplot reconnu \n");nb_col += yyleng;                   find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_matplotlib);}
"for"                       {printf("\n Mc_for reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_for);}
"in range"                  {printf("\n Mc_inrange reconnu \n");nb_col += yyleng;                   find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_in_range);}
"numpy"                     {printf("\n Mc_numpy reconnu \n");nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_numpy);}
"if"                        {printf("\n Mc_if reconnu \n");nb_col += yyleng;                        find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_if);         }
"else"                      {printf("\n Mc_else reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_else);            }
"return"                      {printf("\n Mc_return reconnu \n");nb_col += yyleng;                      find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_return);            }
{comment}                   {printf("\n Comment reconnu \n");nb_col += yyleng;                      find_hash(yytext,"idf-comment","",5,55,0,0);  return (token_comment);} 
{CST_REAL}                  {printf("\n CST_REAL reconnu \n");nb_col += yyleng;                     find_hash(yytext,"CONST","float",atoi(yytext),3,1,1);  return (token_CST_REAL);}
{CST_INT}                   {printf("\n CST_INT reconnu \n");nb_col += yyleng;                      find_hash(yytext,"CONST","int",atoi(yytext),3,10,1);  return (token_CST_INT);}
"int"                       {printf("\n Mc_Int reconnu \n");nb_col += yyleng;                       find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_int);}
"float"                     {printf("\n Mc_FLOAT reconnu \n");nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_float);}
"str"                       {printf("\n Mc_CHAR reconnu \n"); nb_col += yyleng;                     find_hash(yytext,"Mc","",5.2,55,0,0);   return (token_char);}
"bool"                      {printf("\n Mc_STRING reconnu \n"); nb_col += yyleng;                   find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_string);}
[\n]                        {printf("\n Saut_ligne reconnu %d \n",nb_ligne); nb_ligne++; nb_col=1;  find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_retour); }
"."                         {printf("\n point reconnu \n");nb_col++;                                find_hash(yytext,"Mc","",5.2,55,0,0);  return (token_point);}
[ ]                         { nb_col++; }
{IDF}                       {printf("\n IDF reconnu \n");nb_col += yyleng;                          find_hash(yytext,"idf","",5.2,55,1,1);  return (token_idf);}
.                           {printf("Erreur lexicale au niveau de la ligne %d et colone %d \n",nb_ligne, nb_col); nb_col++;  }
%%



