//Matt Adler
//Professor Rivas
//Prog1
//ALWAYS [ROWS][COLUMNS]
#include "hw1given.h"
#include <string.h>

int main(int argc, char * argv[]){
    Board *head;//don't forget to free this head;
    int traversals=0;
    //Position obj;
    int maxRows = 0;
    int maxCols = 0;
    FILE * fptr;
    int exit=0;
    int colExit=0;
    printf("How many times would you like to play?\n"); //MAX COLS
    scanf("%d", &traversals);
    fptr=fopen(argv[1], "r");
    if (fptr==NULL){
        printf("No pointer to access file\n");
        return 0;
    }
    getXy(fptr, &maxCols, &maxRows);  //Gets maxColumns and maxRows
    printf("Columns: %d\n", maxCols); 
    printf("Rows: %d\n", maxRows); 
    makeBoard(fptr,head,maxCols,maxRows); //Make the board.
    printBoard(head, maxRows);
    colExit = traverseBoard(head, maxCols, maxRows);//Gets what column we exited
    printf("\nColumn we exited: ");
    printf("%d\n ", colExit);
    makeProbabilityArray(head, maxCols);
    printf("\nGaussian Distribution: ");
    for (int i=0; i<traversals; ++i){
        colExit= traverseBoard(head, maxCols, maxRows);//Stores what column we exited in variable to use for Gaussian Dist.
        fillProbabilityArray(head,colExit);
    }
    for (int i= 0; i<maxCols; ++i){//Prints Gaussian Distribution
        printf("%d) ", i); //Columns
        printf("%f) ", head->array[i]/traversals); 
    }
    freeBoard(head, maxCols, maxRows);
    free(fptr);
    return 1;
}
int makeProbabilityArray(Board * prob, int maxCols){
    prob->array=(float *)malloc(sizeof(float) * (maxCols));

    //fill array full of zeros
    for (int i= 0; i<maxCols; ++i){
        prob->array[i]=0;
    }
}
int printProbabilities(Board * prob, int maxCols){
    for (int i= 0; i<maxCols; ++i){
        printf("%d) ", i); //MAX COLS
        printf("%f) ", prob->array[i]); //MAX COLS
    }
}
int fillProbabilityArray(Board * prob,int index){
    prob->array[index]+=1.0;
    return 1;
}
int traverseBoard(Board *head, int maxCols,int maxRows){//returns which column we end up in, i.e. y
    //traverse board:
    //1.get starting position, column coordinate, ie Call random Number function
    //2.If (head->board*[y]!=rows){//if we didn't reach the end of the baord;
    //3.GO MIDDLE:
    //  if (head->board[x][y+1]!='X')
    //  goMiddle: head->board[x][y+1];
    //  ELSE:
    // Two CASES FOR TRAVERSAL:
    //  -Encounter obstacle->Get a random number(odd, go left, even go right), then Check:
    //  if obstacle at LEFT ie head->board[x-1][y+1] Only go right head->board[x+1][y+1](goRIGHT)
    //  if obstacle at RIGHT ie head->board[x+1][y+1] Only go left  [x-1][y+1](goLeft)
    // }
    InitRandom();
    int r=0;//current row
    int c=GetRandom(1,maxCols-2);//random x coordinate
    int random=0;
    head->board[r][c]='B';//This is our marker on the board
    while(r<maxRows-1){//while not at end of board
         //printScreen();
        random=GetRandom(1,maxCols-2);

        if (head->board[r+1][c]!='X'){//if no Obastacle, go down a line;
            ++r;//go down one row, one index
        }
        else{//encounter obstactle, must determine if at edge of board, use min, max;

            if (random%2==0){//goRight
                if (head->board[r+1][c+1]!='X'){//check if we can go right Diagonally
                    ++c;
                    ++r;
                }
                else{
                    --c;
                    ++r;//Go diagonally left;
                }
            }
            else{//goLeft
                if (head->board[r+1][c-1]!='X'){//check if we can go left Diagonally
                    --c;
                    ++r;
                }
                else{//go Right
                    ++c;
                    ++r;
                }
            }
        }
        /*
        head->board[r][c]='B';
        for (int i=0; i<maxRows; ++i){
        fputs(head->board[i], stdout);
        }   sleep(.01);
        */
    }
    return c;//This returns what column we are in, store this value in array in main
}
/*
void printScreen(){
    for (int i=0; i<16; ++i){
    printf("\n");
    }   
}
*/

//Position getXy(FILE * fptr){//gets size of the board
void getXy(FILE * fptr, int * cols, int * rows){
    char * ptr;
    char header[250];
    //Position obj;

    if (fgets(header, 250, fptr)!=NULL){
        //obj.x= strtol(header,&ptr, 10);
        *cols = strtol(header, &ptr, 10);
            //stores Max ROWS in our Board struct
        if (ptr!=NULL){
            *rows = strtol(ptr +1, NULL, 10);
        }
    }

    //return obj;//returns the Position struct which holds Max x, y.
}
int makeBoard(FILE *fptr, Board *head, int cols, int rows){
    //FILE *fptr;
    //fptr=fopen(txt, "r");
    //if (fptr==NULL){
    //    return 0;
    //}
    //ALLOCATE BOARD:
    head->board= (char **) malloc(sizeof(char*)* rows);//create columns
    for (int x=0; x<rows; ++x){
        head->board[x]= (char *)malloc(sizeof(char) *(cols));  //create rows for each column;
    }
    //FILL BOARD:
    for (int r=0; r<rows; ++r){
        fgets(head->board[r], cols+2, fptr);
    }
    return 1;
}
int freeBoard(Board *head, int maxCols, int maxRows){
    for (int r=0; r<maxRows; ++r){
        free(head->board[r]);
    }
    free(head->board);
    return 1;
}
int printBoard(Board * head, int rows){
    //PRINT BOARD:
    printf("HERE'S THE BOARD: \n");//Traversing Rows
    for (int r=0; r<rows; ++r){
        printf("%d) ", r); //MAX COLS
        fputs(head->board[r], stdout);
    }   
    return 1;
}

/*
   int makeBoard(char *txt){
   Board plinko;
   Position max;
   int start=0;
   int left=0;
   int right=0;
   FILE *fptr;
   fptr=fopen(txt, "r");
   if (fptr==NULL){
   return 0;
   }
   max= getXy(fptr);

   printf("xSize: ");
   printf("%d\n ", max.x);//MAX ROWS
   printf("ySize: ");
   printf("%d\n ", max.y);//MAX COLUMNS


//create the array:
plinko.board= (char **) malloc(sizeof(char*)* max.y);//create columns
for (int x=0; x<max.y; ++x){
plinko.board[x]= (char *)malloc(sizeof(char) *(max.x+2));  //create rows for each column;
}
//end creation of array sized just right

//Now we fill the board:
for (int x=0; x<max.y; ++x){
fgets(plinko.board[x], max.x+2, fptr);
}

//print board:
printf("HERE'S THE BOARD: ");
for (int x=0; x<max.y; ++x){
fputs(plinko.board[x], stdout);
}   

//traverse board:
//1.get starting position, x coordinate, y=0, ie Call random Number function
//2. determine if plinko.board[x+1][y+1]=='X', call random number to go left or right,
//if odd, see if we can go left,if (plinko.board[x-1]!='X',then plinko.board[x-1][y+1].
//if even, see if we can go right,if (plinko.board[x+1]!='X',
InitRandom();
start=GetRandom(1,max.x-1);//first and last index is null
printf("xStarting Position:");
printf("%d\n ", start);//MAX ROWS




}

*/
