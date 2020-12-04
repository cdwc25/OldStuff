//Connor Cerisano, c0630428
//2020-02-22
//LetterRecognition: LettersPANN.h

#ifndef LETTERS_PANN
#define LETTERS_PANN

#include "PANN.h"
#include "Bitmap.h"

//Class describing the network for recognizing letters from images (based on the perceptron network)
class LettersPANN
{
private:
	//Learning speed factor
	double NI;

	//Dynamic bitmap table for training
	Bitmap** trainingBitmaps;

	//Perceptron network for letter recognition
	PANN network;

	//Array for letters to be written to the pictures
	char characterLookup[7];

public:
	//The constructor adopts the learning speed factor
	LettersPANN(double NI);

	//Destructor
	~LettersPANN (void);

	//This function prints the network configuration (perceptron weights, etc.)
	void printNetworkConfiguration();

	//Bitmap testing function - the parameter is an indicator on the bitmap to be tested
	//This function gives the bitmap to the network, and prints the test results
	void printTestBitmap(Bitmap* bitmap);
};

#endif
