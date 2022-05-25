Matt Adler
Professor Rivas
1/22/2020

DIRECTIONS FOR EXECUTING THE PROGRAM:
1) type "make" to compile
2) type ./imp externalData.txt
3) Follow the prompt, i.e. the number of times the user wishes to play Plinko
-The purpose of this program is to simulate a Plinko game and represent Gaussian distrbution based on the number of times the user enters s/he wishes to play.
-There is a struct that holds a char**board. This is the plinko board.
-In the main function, a pointer of type struct board is created (called head) This pointer is the means of accessing, populating, and traversing the board. 
Here is the algorithm for traversal:
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
-Upon each traversal, the column at which the plinko exits is caught in the variable called exit. This will be placed into another array that holds the max amount of columns from that board. The exit is the index in which we increment.     

