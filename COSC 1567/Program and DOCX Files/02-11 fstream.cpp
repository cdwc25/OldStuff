//02-11.cpp, player.txt in .../Project2-11/Project2-11
//same directory as *.vcxproj  file
#include <iostream>
#include <fstream>
#include <string>
#include <conio.h>
using namespace std;

int main( )
{
	string firstName, lastName;
	int score;
  	fstream inputStream;

 	inputStream.open("player.txt");

 	inputStream >> score;
	
 	cout << "Name: " << firstName << " "
 		<< lastName << endl;
	cout << "Score: " << score << endl;

	_getch();

 	inputStream.close();

     return 0;
}
