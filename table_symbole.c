#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "table_symbole.h"


// Table de hashage
int TAILLE = 1000;
Element* table_symbole_MC[1000];
Element* table_symbole[1000];




// Fonction qui hash un chaine donnée avec le code ASCII
int hash_function(char *chaine)
{
    int hash_result = 0;
    int i ;

    for (i = 0 ; chaine[i] != '\0' ; i++)
        hash_result += chaine[i];


    hash_result %= TAILLE;
    return hash_result;
}

// Fonction qui ajoute un élement dans la table de hashage
void insert_hash(char name[], char type[], char code[], float val,int array,int dim , int typo)
{
    if (typo == 1){
        printf("\n --- Insertion de l'entite : | %s | ... \n",name);

        int hashed_name = hash_function(name);

        Element* current_element = table_symbole[hashed_name];
        Element* new_element = (Element*)malloc(sizeof(Element));  
        
        strcpy(new_element->name, name);
        strcpy(new_element->type, type);
        strcpy(new_element->code, code);

        new_element->value = val;
        new_element->is_array = array;
        new_element->dimension = dim;
        new_element->suiv = NULL;

        if (current_element) {
            while(current_element->suiv)
                current_element = current_element->suiv;
            current_element->suiv = new_element;
            return;
        }

        table_symbole[hashed_name] = new_element; 
    }
    else{
        printf("\n --- Insertion de l'entite : | %s | ... \n",name);

        int hashed_name = hash_function(name);

        Element* current_element = table_symbole_MC[hashed_name];
        Element* new_element = (Element*)malloc(sizeof(Element));  
        
        strcpy(new_element->name, name);
        strcpy(new_element->type, type);
        strcpy(new_element->code, code);

        new_element->value = val;
        new_element->is_array = array;
        new_element->dimension = dim;
        new_element->suiv = NULL;

        if (current_element) {
            while(current_element->suiv)
                current_element = current_element->suiv;
            current_element->suiv = new_element;
            return;
        }

        table_symbole_MC[hashed_name] = new_element; 
    }
}

// Fonction qui recherge un identifiant dans une liste de hashage
int find_hash(char name[], char code[], char type[], int val,int array,int dim,int typo)
{

    int hashed_name = hash_function(name);

    if (typo == 1){


        Element* current_element = table_symbole[hashed_name];

        while (current_element != NULL && (strcmp(name, current_element->name) != 0))
            current_element = current_element->suiv;

        
        if (current_element == NULL) {
            printf("\n --- The Entity | %s | was found ? %s \n",name,current_element);
            insert_hash(name, type, code, val,array,dim,typo);
            return 0;
        }
        
        printf("\n Entite existante : | %s | ... \n",name);
        return 1;
    }
    else {

        
         Element* current_element = table_symbole_MC[hashed_name];

        while (current_element != NULL && (strcmp(name, current_element->name) != 0))
            current_element = current_element->suiv;

        
        if (current_element == NULL) {
            printf("\n --- The Entity | %s | was found ? %s \n",name,current_element);
            insert_hash(name, type, code, val,array,dim,typo);
            return 0;
        }
        
        printf("\n Entite existante : | %s | ... \n",name);
        return 1;
    }
}

// Fonction qui affiche la table des symboles
void show_ts()
{

    printf("\n\n\n\n/*************** TABLE DES SYMBOLES *************/\n");
    printf("\n\n\n\n/*************** Table des symboles IDF et CONST *************/\n");
    printf("______________________________________________________________________\n");
    printf("\t|   Nom_Entite   |  Code_Entite  |   Type_Entite  |  Val_Entite \n");
    printf("______________________________________________________________________\n");
    
    int i;

    for(i=0;i<TAILLE;i++){

        Element* current_element = table_symbole[i];
        while (current_element)
        {
            if (strcmp(current_element->code, "CONST") == 0 && (strcmp(current_element->type, "float") == 0 || strcmp(current_element->type, "int") == 0))
                printf("\t|%14s    |%10s     | %10s     | %10f \t\n", current_element->name, current_element->code, current_element->type, current_element->value);
            else
                printf("\t|%14s    |%10s     | %10s     | \t\n", current_element->name, current_element->code, current_element->type);

            current_element = current_element->suiv;
        }
    }
  

    printf("\n\n\n\n/*************** Table des symboles mots cles *************/\n");
    printf("_____________________________________________________\n");
    printf("\t| 	 Nom_Entite        |   CodeEntite   | \n");
    printf("_____________________________________________________\n");

    for(i=0;i<TAILLE;i++){


        Element* current_element2 = table_symbole_MC[i];
        while (current_element2)
        {
            printf("\t|%25s |%12s    | \n", current_element2->name, current_element2->code);
            current_element2 = current_element2->suiv;
        }

    }

}
