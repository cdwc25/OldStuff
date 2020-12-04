//Connor Cerisano, c0630428
//2020-02-22
//LetterRecognition: Perceptron.h

#ifndef PERCEPTRON_H
#define PERCEPTRON_H

#include <cstdlib>
#include <cmath>
#include <iostream>

using namespace std;

//Class describing a single perceptron
class Perceptron
{
private:
	//Perceptron input
	int inputsNumber;

	//Scales to enter for the perceptron
	double* w;

	//Perceptron output
	double y;

	//Perceptron threshold (extra weight)
	double threshold;

	//Perceptron classification error
	double error;

	//Perceptron learning rate factor
	double NI;

public:
	//Constructor: inputsNumber - number of perceptron inputs, NI - learning rate coefficient
	Perceptron(int inputsNumber, double NI);

	//Perceptron destructor
	~Perceptron(void);

	//This function randomizes the perceptron weights
	void drawWeights();

	//This function trains the perceptron so that x input is expectedY
	void train(double* x, double expectedY);

	//This function returns a classification error
	double getError();

	//This function prints the perceptron's configuration
	void printPerceptronConfiguration();

	//This function performs the test for x inputs and writes the results to the result variable (by reference)
	void test(double* x, double& resultY);

private:
	//Step activation function for calculating perceptron excitation
	double stepActivationFuction(double x);
};

#endif
