//Connor Cerisano, c0630428
//2020-02-22
//LetterRecognition: PANN.h

#ifndef PANN_H
#define PANN_H

#include "Perceptron.h"
#include <iostream>

using namespace std;

//This class describes a network composed of one perceptron layer
class PANN
{
private:
	//Network Learning Rate
	double NI;

	//Dynamic array of perceptrons
	Perceptron** layer;

	//Number of entries to the network
	int inputsNumber;

	//Number of network outputs (the number of perceptrons)
	int outputsNumber;

	//Network classification error
	double layerError;

public:
	//Network Constructor. NI - learning rate coefficient, inputsNumber - number of network inputs,
	//outputsNumber - number of network outputs (number of perceptrons)
	PANN(double NI,int inputsNumber, int outputsNumber);

	//Network destructor
	~PANN(void);

	//This function randomizes network weights
	void drawWeights();

	//This function trains the network to give expectedY for the given x network result
	void train(double* x, double* expectedY);

	//This function returns a network classification error
	double getError();

	//This function prints network configurations (weights etc.)
	void printNetworkConfiguration();

	//This function tests the input given by x, and writes the results to the resultY variable (array)
	void test(double* x, double* resultY);
};

#endif

