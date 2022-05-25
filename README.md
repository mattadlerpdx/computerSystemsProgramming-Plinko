# programmingSystems-plinko
From CS201 Portland State University. Plinko program
DIRECTIONS FOR EXECUTING THE PROGRAM:
1) type "make" to compile
2) type ./imp externalData.txt
3) Follow the prompt, i.e. the number of times the user wishes to play Plinko
-The purpose of this program is to simulate a Plinko game and represent Gaussian distrbution based on the number of times the user enters s/he wishes to play.
-There is a struct that holds a char**board. This is the plinko board.
-In the main function, a pointer of type struct board is created (called head) This pointer is the means of accessing, populating, and traversing the board. 
Here is the algorithm for traversal:
1.get starting position, column coordinate, ie Call random Number function
2.If (head->board*[y]!=rows){//if we didn't reach the end of the baord;
3.GO MIDDLE:
4.if (head->board[x][y+1]!='X')
5.goMiddle: head->board[x][y+1];
6. Else
7.Two CASES FOR TRAVERSAL:
8.Encounter obstacle->Get a random number(odd, go left, even go right), then Check:
9.if obstacle at LEFT ie head->board[x-1][y+1] Only go right head->board[x+1][y+1](goRIGHT)
10.if obstacle at RIGHT ie head->board[x+1][y+1] Only go left  [x-1][y+1](goLeft)
11.Upon each traversal, the column at which the plinko exits is caught in the variable called exit. This will be placed into another array that holds the max amount of columns from that board. The exit is the index in which we increment.     

