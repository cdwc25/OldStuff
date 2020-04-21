//02-12.cpp
#include <iostream>
#include <fstream>
#include <string>
#include <conio.h>
using namespace std;


int main( )
{
  	string text;
  	fstream inputStream;


 	inputStream.open("player.txt");

 	while (inputStream >> text)
 	{
 		cout << text << endl;
 	}
	inputStream.close();
	_getch();
	return 0;
}
