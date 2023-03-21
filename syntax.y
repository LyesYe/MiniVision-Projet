%{
#include <stdlib.h>
#include <stdio.h>
%}

%token      token_ParOuvrante   token_ParFermante  token_ParOuvrante token_ParFermante    token_CrochOuvrante token_CrochFermante  token_virgule token_Deux_Points    token_Pourcentage   token_Add  token_Sub token_Mult   token_Div  token_Tab token_import token_as token_matplotlib token_for    token_in_range  token_numpy   token_comment  token_int token_float  token_char    token_idf   token_string



%start S

%%
S : token_import {printf("Programme Correct"); YYACCEPT;};


%%


main(){
    yyparse(); // analyseur lexical
    yywrap(); // analyseur syntaxique
}