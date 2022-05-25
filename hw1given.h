#pragma once
#include <assert.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
/*IMPORTANT: CALL THIS FUNCTION ONCE AT THE START OF THE PROGRAM!*/
/*INITIALIZAES THE RANDOM NUMBER GENERATOR*/


//typedef struct Position {//coordinates
//    int x;
//    int y;
//}Position;


void printScreen();

typedef struct Board{
    char ** board;
    float * array;
}Board;

int printProbabilities(Board * prob, int maxCols);
int makeProbabilityArray(Board * prob, int maxCols);
int fillProbabilityArray(Board * prob,int index);
int traverseBoard(Board *head, int xMax,int yMax);//returns which column we end up in, i.e. y

int makeBoard(FILE *fptr, Board *head, int xMax, int yMax);
//int makeBoard(char *txt);

int freeBoard(Board *head, int maxCols, int maxRows);
int printBoard(Board * head, int rows);
void getXy(FILE * fptr, int * cols, int * rows);

void InitRandom(void)
{
	time_t timestr;

#ifdef _DEBUG
	timestr = 0;
#else
	time(&timestr);
#endif

	srand((unsigned int)timestr);
}

/*RETURNS A RANDOM UNSIGNED INTEGER IN THE INTERVAL [MINVAL,MAXVAL]*/
unsigned int GetRandom(unsigned int minval, unsigned int maxval)
{
	char temp[sizeof(int)];
	int* val;
	int i;
	

	val = (int*)temp;

	for (i = 0; i < sizeof(unsigned int); i++)
	{
		temp[i] = rand() & 0xFF;
	}

	*val = ((*val) % (maxval - minval + 1)) + minval;
	assert((*val <= maxval) && (*val >= minval));
	return  *val;
}
