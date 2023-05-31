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

  
%token  token_ParOuvrante token_ParFermante token_CrochOuvrante token_CrochFermante
%token  token_virgule token_gui1 token_gui2 token_Deux_Points token_test_equal token_point
%token  token_Tabulation
%token  token_From token_Pil token_Image token_Def token_import token_as token_matplotlib token_numpy token_cv2
%token  token_load token_resize token_save token_show token_close token_Open token_Size token_convert token_new token_png
%token  token_for token_in_range token_return
%token  token_if token_else
%token  token_comment
%token  token_CST_REAL
%token  <int> token_CST_INT
%token  token_int token_float token_char token_Final token_string
%token  <str>token_idf
%token  token_retour
 


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
    |ReturnInst Main
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

Fun :
     token_Open
    |token_Size
    |token_load
    |token_resize
    |token_save
    |token_show
    |token_close
    |token_convert
    |token_new
    ;

idfImage :
        token_idf token_point token_png
        ;


// Declarations Part -----------------------------------------------------------

Declaration_part:
                 Untyped_declaration
                |Typed_declaration
                ;

Untyped_declaration : 
                 idfSuite token_equal Expression 
                |token_idf token_CrochOuvrante Expression token_CrochFermante token_equal Expression
                |idfSuite token_equal FunExpression
                |FunExpression
                ;


Typed_declaration : 
                 token_idf token_Deux_Points Type
                |token_idf token_Deux_Points Type token_equal Expression
                |token_idf token_Deux_Points token_Final Type token_equal Expression
                ;

idfSuite :
                token_idf token_virgule idfSuite
                |token_idf
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
                |token_gui1 idfImage token_gui1
                |token_gui2 idfImage token_gui2
                |token_gui2 Numbers token_gui2
                |token_gui1 Numbers token_gui1
                |token_idf token_ParOuvrante Expression token_ParFermante
                |token_CrochOuvrante Expression token_CrochFermante
                |token_idf token_CrochOuvrante Expression token_CrochFermante
                |idfSuite
                |Numbers
                ;

Numbers : 
                 token_CST_INT 
                |token_CST_REAL 
                ;

Type : 
                 token_int
                |token_float
                |token_char
                |token_string
                ;

FunExpression :
                 token_idf PointFunExp
                |Class PointFunExp
                ;

PointFunExp : 
                 token_point Fun PointFunExp
                |token_point Fun token_ParOuvrante Params token_ParFermante PointFunExp
                |token_point Fun token_ParOuvrante token_ParFermante PointFunExp
                |token_ParOuvrante Params token_ParFermante
                |
                ;


ReturnInst : 
                 token_return Expression
                ;


// instructions Part -----------------------------------------------------------


instructions_part : 
                 Function_instruction
                |token_comment
                |Loop_instruction 
                |Condition_instruction
                ;




Function_instruction : 
                 token_Def token_idf token_ParOuvrante Params token_ParFermante token_Deux_Points Main ReturnInst
                ;

Params : 
                 Expression token_virgule Params
                |token_idf token_virgule Params
                |Expression
                ;

Loop_instruction : 
                 token_for token_idf token_in_range token_ParOuvrante Expression token_ParFermante token_Deux_Points Main token_else token_Deux_Points Main
                ;

Condition_instruction : 
                 token_if TestExpressions token_Deux_Points
                ;

TestExpressions : 
                 Expression token_test_equal Expression
                |Expression token_inf Expression
                |Expression token_sup Expression
                |Expression token_inf token_equal Expression
                |Expression token_sup token_equal Expression
                ;



%%






int main()
{
    yyparse();
    show_ts();
    return 0;
}



int yyerror(char* msg) 
{
	printf("Erreur Syntaxique: %s, Ligne ( %d ) & column ( %d ), entite lexicale (%s) \n", msg, nb_ligne, nb_col, yylval.str);

	return 1;
}
