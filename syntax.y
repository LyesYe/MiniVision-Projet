%{
#include <stdlib.h>
#include <stdio.h>
%}

%token      token_ParOuvrante   token_ParFermante  token_ParOuvrante token_ParFermante    token_CrochOuvrante token_CrochFermante  token_virgule token_Deux_Points    token_Pourcentage   token_Add  token_Sub token_Mult   token_Div  token_Tab token_import token_as token_matplotlib token_for    token_in_range  token_numpy   token_comment  token_int token_float  token_char    token_idf   token_string token_CST_REAL token_CST_INT token_Nombre



%start S

%%
S: IMPORT_LIB IMPORT_LIB DECLARTION { printf("programe correct syntaxiquement"); YYACCEPT;};

IMPORT_LIB: IMPORT LIB AS IDF
LIB: NUMPY | MATPLOTLIB 

DECLARTION: IDF EGALE VAL
VAL: IDF

%%


main(){
    yyparse(); // analyseur lexical
    yywrap(); // analyseur syntaxique
}