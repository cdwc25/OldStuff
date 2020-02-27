//Connor Cerisano (c0630428), 12/01/2019, Proj 4

#include <iostream> //cout, cin
#include <fstream> //File Input Stream
#include <ostream> //File Output Stream
#include <cassert> //assert()
#include <vector> //for vector

using namespace std;

void main () //Main function
{
	//Variables
	ifstream inFile; //Ifstream variable, for reading files
	ofstream outFile; //Ofstream variable, for writing to files
	string fileName; //Variable for filename (to analyze)
	char ch; //Variable for reading text file characters
	vector <int> occurrences(26); //Vector 

	//Introduction
	cout << "Welcome! This program counts the number of occurrences of each alphabetic letter in a file.\n";
	cout << "Please enter the file name to analyze. Make sure to include .txt at the end of the filename.\n";
	cin >> fileName; //Ask user to enter a filename to analyze

	//Open the file input and output streams.
	inFile.open(fileName);
	outFile.open("results.txt");

	//Check if the file was successfully opened
	assert(inFile.is_open());

	//Run this loop until the end of file is reached.
	for (;;)
	{
		inFile.get(ch); //Get a character from the file first
		ch = tolower(ch); //Convert character to lowercase form
		
		//Check for each character. If the character is found, 
		//add 1 to the occurrance value corresponding to that character.
		switch (ch)
		{
		case 'a': occurrences[0]++; break;
		case 'b': occurrences[1]++; break;
		case 'c': occurrences[2]++; break;
		case 'd': occurrences[3]++; break;
		case 'e': occurrences[4]++; break;
		case 'f': occurrences[5]++; break;
		case 'g': occurrences[6]++; break;
		case 'h': occurrences[7]++; break;
		case 'i': occurrences[8]++; break;
		case 'j': occurrences[9]++; break;
		case 'k': occurrences[10]++; break;
		case 'l': occurrences[11]++; break;
		case 'm': occurrences[12]++; break;
		case 'n': occurrences[13]++; break;
		case 'o': occurrences[14]++; break;
		case 'p': occurrences[15]++; break;
		case 'q': occurrences[16]++; break;
		case 'r': occurrences[17]++; break;
		case 's': occurrences[18]++; break;
		case 't': occurrences[19]++; break;
		case 'u': occurrences[20]++; break;
		case 'v': occurrences[21]++; break;
		case 'w': occurrences[22]++; break;
		case 'x': occurrences[23]++; break;
		case 'y': occurrences[24]++; break;
		case 'z': occurrences[25]++; break;
		default: break; //Default case, just exit the switch statement
		}
		if (inFile.eof()) break; //Exit loop if the end of file is reached
	}

	cout << "\nResults:\n"; //Display results
	for (int i = 0; i < 26; i++)
	{
		//Display the integer value at every location in our occurrences vector
		cout << "CHAR: " << (char)(i + 97) << " OCCURRENCES: " << occurrences[i] << endl;
		outFile << "CHAR: " << (char)(i + 97) << " OCCURRENCES: " << occurrences[i] << endl;
	}
	cout << "These results have been written to results.txt.\n\n";

	inFile.close(); //Close the file input stream
	outFile.close(); //Close the file output stream

	system("pause"); //Pause console so we can see results
}