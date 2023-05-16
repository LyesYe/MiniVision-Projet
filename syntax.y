%{
#include <stdlib.h>
#include <stdio.h>
#include "table_symbole.h"

int nb_col;
int nb_ligne;
%}




%union {
	int entier;
	char* str;
	float reel;

}

%token  
token_ParOuvrante
token_ParFermante
token_CrochOuvrante
token_CrochFermante
token_virgule
token_gui1
token_gui2
token_Deux_Points
token_Final
token_test_equal
token_Tabulation
token_From
token_Pil
token_Image
token_Def
token_Open
token_Size
token_import
token_as
token_matplotlib
token_for
token_in_range
token_numpy
token_if
token_else
token_comment
token_CST_REAL
<int>token_CST_INT
token_int
token_float
token_char
token_string
<str>token_idf
token_retour
token_point
token_cv2
%left token_inf token_sup token_equal
%left token_Pourcentage token_Div token_Mult
%left token_Add token_Sub



%start S

%%

S :  Main {printf("\n---------------------- Programme syntaxiqement correcte %d --------------------\n",nb_ligne);};


Main :
     Import_part Main
    |Declaration_part Main
    |token_retour Main
    |instructions_part Main
    |
    ;

// Import Part -----------------------------------------------------------


Import_part :    
                 token_import LIB token_as token_idf 
                |token_import LIB 
                |token_From LIB token_import Class 
                |token_From LIB token_import Class token_as  token_idf 
                ;

LIB :
     token_matplotlib
    |token_numpy 
    |token_cv2
    |token_Pil
    ;
Class :
     token_Image
    ;



// Declarations Part -----------------------------------------------------------

Declaration_part: 
                 Untyped_declaration
                |Typed_declaration
                ;

Untyped_declaration : 
                 token_idf token_equal Expression 
                ;


Typed_declaration : 
                 token_idf token_Deux_Points Type 
                |token_idf token_Deux_Points Type token_equal Expression
                |token_idf token_Deux_Points token_Final Type token_equal Expression 
                ;



Expression : 
                 token_CST_INT 
                |token_CST_REAL 
                |Expression token_Add Expression
                |Expression token_Sub Expression
                |Expression token_Mult Expression
                |Expression token_Div Expression
                |token_ParOuvrante Expression token_ParFermante
                |token_gui2 token_idf token_gui2
                |token_gui1 token_idf token_gui1
                |token_idf token_ParOuvrante Expression token_ParFermante
                |token_CrochOuvrante Expression token_CrochFermante
                |token_idf token_CrochOuvrante Expression token_CrochFermante
                |
                ;


Type : 
                 token_int
                |token_float
                |token_char
                |token_string
                ;

// instructions Part -----------------------------------------------------------


instructions_part : 
                 Function_instruction
                ;




Function_instruction : 
                 token_Def token_idf token_ParOuvrante Params token_ParFermante token_Deux_Points 
                ;

Params : 
                 Expression token_virgule Params
                |token_idf token_virgule Params
                |Expression
                |token_idf
                ;


%%

int main()
{
    yyparse();
    show_ts();
    return 0;
}

int yyerror(const char *msg)
{
    printf("Error: %s\n", msg);
    return 0;
}