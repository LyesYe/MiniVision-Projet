
%{
#include <stdlib.h>
#include <stdio.h>
#include<string.h>
#include "syntax.tab.h"

extern int nb_col= 0,nb_ligne=0;
// extern YYSTYPE yylval;

%}

lettreMin [a-z]
lettreMaj [A-Z]
chiffre [0-9]
comment ^#[^\n]*\n
IDF ({lettreMaj})({lettreMaj}|{lettreMin}|{chiffre}|-)*

%%
"("                          {printf("\n Sep_ParOuvrante reconnu \n"); nb_col += yyleng;   return (token_ParOuvrante);}
")"                          {printf("\n Sep_ParFermante reconnu \n"); nb_col += yyleng;   return (token_ParFermante);}
"["                          {printf("\n Sep_CrochOuvrante reconnu \n"); nb_col += yyleng; return (token_CrochOuvrante);}
"]"                          {printf("\n Sep_CrochFermante reconnu \n"); nb_col += yyleng; return (token_CrochFermante);}
","                          {printf("\n Sep_virgule reconnu \n"); nb_col += yyleng;       return (token_virgule);}
":"                          {printf("\n Sep_Deux_Points reconnu \n"); nb_col += yyleng;   return (token_Deux_Points);}
"%"                          {printf("\n Sep_Pourcentage reconnu \n"); nb_col += yyleng;   return (token_Pourcentage);}
"+"                          {printf("\n Sep_Add reconnu \n"); nb_col += yyleng;           return (token_Add);}
"-"                          {printf("\n Sep_Sub reconnu \n"); nb_col += yyleng;           return (token_Sub);}
"*"                          {printf("\n Sep_Mult reconnu \n"); nb_col += yyleng;          return (token_Mult);}
"/"                          {printf("\n Sep_Div reconnu \n"); nb_col += yyleng;           return (token_Div);}
[ \t]                        {printf("\n Sep_tab reconnu \n"); nb_col += yyleng;           return (token_Tab);}
"import"            {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_import);}
"as"                {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_as);}
"matplotlib.pyplot" {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_matplotlib);}
"for"               {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_for);}
"in range"          {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_in_range);}
"numpy"             {printf("\n Mc_PROG_ID reconnu \n");nb_col += yyleng;               return (token_numpy);}
{comment}         {printf("\n Comment reconnu \n");nb_col += yyleng;      return (token_comment);} 
"Int"   {printf("\n Mc_Int reconnu \n");nb_col += yyleng;       return (token_int);}
"float" {printf("\n Mc_FLOAT reconnu \n");nb_col += yyleng;      return (token_float);}
"char"  {printf("\n Mc_CHAR reconnu \n"); nb_col += yyleng;       return (token_char);}
"bool"  {printf("\n Mc_STRING reconnu \n"); nb_col += yyleng;       return (token_string);}
[\n]                           {nb_ligne++; nb_col=1;}
.                            {printf("Erreur lexicale au niveau de la ligne %d et colone %d \n",nb_ligne, nb_col); nb_col++;  }
{IDF}                   {printf("\n IDF reconnu \n");nb_col += yyleng;      return (token_idf);}


%%



