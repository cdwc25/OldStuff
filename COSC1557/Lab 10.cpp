//Connor Cerisano (c0630428), 2019-11-14, Lab 9

#include <iostream> //cout, cin
#include <fstream> //File Input Stream
#include <ostream> //File Output Stream
#include <cassert> //assert()
using namespace std;

int main() //Main function
{
	char ch; //Variable for changing text file characters
	
	//Declare ifstream and ofstream variables, for reading and writing
	ifstream inFile;
	ofstream outFile;

	//Open the file input and output streams.
	inFile.open("encoded.txt");
	outFile.open("decoded.txt");

	//Check if the file was successfully opened
	assert(inFile.is_open());

	cout << "Welcome to the program!\n";
	cout << "This program decodes an encoded text file using the Ceasar cipher! (+3)";
	cout << "\nThe decoded file reads...\n\n";

	//Decode
	for (;;)
	{
		inFile.get(ch); //Get a character from the file first

		//decrypt for lowercase letters
		if (ch >= 'a' && ch <= 'z') 
		{
			ch = ch - 3; //decrease the letter by 3

			//account for special cases (the equation z-a+1 conveniently works here.)
			if (ch < 'a') ch = ch + 26; //if < 97, add value of z-a+1 in ascii (simplified to 26 here)

			cout << ch; //print the character to the console
		}

		//decrypt for uppercase letters
		else if (ch >= 'A' && ch <= 'Z') 
		{
			ch = ch - 3; //decrease the letter by 3

			//account for special cases (the equation Z-A+1 conveniently works here.)
			if (ch < 'A') ch = ch + 26; // if < 65, add value of Z-A+1 in ascii (simplified to 26 again)

			cout << ch; //print the character to the console
		}

		else cout << ch; //Print out all other characters to console without changing them
		outFile.put(ch); //Write decoded character to decoded.txt
		if (inFile.eof()) break; //If no characters are left (end of file reached), exit loop
	}

	inFile.close(); //Close the file input stream
	outFile.close(); //Close the file output stream
	cout << "The decoded file has been written to decoded.txt.\n\n";
	system("pause"); //Pause console so we can see results
}