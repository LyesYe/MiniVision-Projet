
// Structure d'un élément de la table de hashage
typedef struct Element
{
    char name[20]; 
    char code[20]; 
    char type[20]; 
    int is_array;
    int dimension;
    float value;     
    struct Element *suiv;
} Element;


int hash_function(char *chaine);

void insert_hash(char name[], char type[], char code[], float val,int array,int dim,int typo);

void find_hash(char name[], char code[], char type[], int val,int array,int dim,int typo);

void show_ts();
