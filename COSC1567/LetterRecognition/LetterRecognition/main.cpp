//Connor Cerisano, c0630428
//2020-03-14
//LetterRecognitionV2

#include "Bitmap.h"
#include "LettersPANN.h"
#include "PANN.h"
#include "Perceptron.h"
#include <ctime> //Get and manipulate date/time information
#include <cstdlib> //Memory management, random number generation, integer arithmetics, searching/sorting/converting
#include <conio.h> //Console input/output, style
using namespace std; //cin,cout

Perceptron::Perceptron(int inputsNumber, double NI)
{
	this->NI = NI; //NOTE: The arrow operator (->) allows access to elements in structures and unions.
	this->inputsNumber = inputsNumber; //The 'this' pointer is used to retrieve the object hidden by the local variable.
	w = new double[inputsNumber]; //Create weight tables, for scales
	for (int i = 0; i < inputsNumber; i++)
	{
		w[i] = rand() / (double)RAND_MAX * 2.0 - 1.0; //Draw a random number for the weight
	}
	threshold = 0.0;
	y = 0.0;
	error = 0.0;
}
Perceptron::~Perceptron(void)
{
	if (w != nullptr) {
		delete[] w; //Deconstruct weight tables
	}
}
void Perceptron::drawWeights() {
	for (int i = 0; i < inputsNumber; i++)
	{
		w[i] = rand() / (double)RAND_MAX * 2.0 - 1.0; //Draw a random number for the weight
	}
}
void Perceptron::train(double* x, double expectedY) {
	double sum = 0.0; 
	for (int i = 0; i < inputsNumber; i++) {
		sum += w[i] * x[i]; //Compute the ...stimulation?
	}
	sum += threshold; //Add the threshold
	y = stepActivationFuction(sum); //Compute the perceptron's output
	for (int i = 0; i < inputsNumber; i++) {
		w[i] = w[i] + NI * (expectedY - y) * x[i]; //Update the weights, to improve the perceptron's output
	}
	error = (expectedY - y); //Calculate the network error
	threshold = threshold + NI * (expectedY - y); //Update the threshold
}
double Perceptron::getError() {
	return abs(error); //Return the absolute value of the error
}
double Perceptron::stepActivationFuction(double x) {
	//The activation function returns 1 or -1 (the perceptron has only two values)
	if (x >= 0) return 1; 
	else return -1;
}
void Perceptron::printPerceptronConfiguration() {
	cout << "Perceptron configuration:" << endl;
	cout << "threshold = " << threshold << endl;
	for (int i = 0; i < inputsNumber; i++)
	{ //Display the perceptron weights
		cout << "w" << i << " = " << w[i] << endl;
	}
}
void Perceptron::test(double* x, double& resultY) {
	double sum = 0.0;
	for (int i = 0; i < inputsNumber; i++) {
		sum += w[i] * x[i]; //Calculate the ...stimulations? from the x vector
	}
	sum += threshold; //Add the threshold
	resultY = stepActivationFuction(sum); //Calculate the output of the network, write the output to the resultY variable
}
PANN::PANN(double NI, int inputsNumber, int outputsNumber)
{
	//Set the parameter variables to the class variable
	this->NI = NI; 
	this->outputsNumber = outputsNumber;
	this->inputsNumber = inputsNumber;
	//Create a dynamic array of perceptrons
	layer = new Perceptron * [outputsNumber];
	for (int i = 0; i < outputsNumber; i++)
	{
		layer[i] = new Perceptron(inputsNumber, NI); 
	}
	layerError = 0.0; //Set the network error to zero
}
PANN::~PANN(void)
{
	if (layer != nullptr) { //Deconstruct the dynamic array of perceptrons
		for (int i = 0; i < outputsNumber; i++)
		{
			if (layer[i] != nullptr) {
				delete layer[i];
			}
		}
		delete[] layer;
	}
}
void PANN::drawWeights() {
	for (int i = 0; i < outputsNumber; i++) //Draw the initial weights for each perceptron
	{
		layer[i]->drawWeights();
	}
}
void PANN::train(double* x, double* expectedY) {
	for (int i = 0; i < outputsNumber; i++) //Train more perceptrons, for given inputs and outputs
	{
		layer[i]->train(x, expectedY[i]);
	}
	layerError = 0.0; 
	for (int i = 0; i < outputsNumber; i++) //Count the total error of all perceptrons
	{
		layerError += layer[i]->getError();
	}
}
double PANN::getError() {
	return layerError; //Return the error of all perceptrons
}
void PANN::printNetworkConfiguration() {
	cout << "Network configuration" << endl;
	for (int i = 0; i < outputsNumber; i++) //Print the configurations of all network perceptrons
	{
		cout << "Perceptron number " << (i + 1) << endl;
		layer[i]->printPerceptronConfiguration();
	}
}
void PANN::test(double* x, double* resultY) {
	for (int i = 0; i < outputsNumber; i++) //Test all network perceptrons (every output)
	{
		layer[i]->test(x, resultY[i]);
	}
}
LettersPANN::LettersPANN(double NI) :network(NI, 63 * 3, 7)
{ //In the header file, we create a network with 63 * 3 inputs and 7 outputs (63 - numberofpixels, 3. Each pixel has 3 colors.)
	this->NI = NI;
	trainingBitmaps = new Bitmap * [21]; //Create an array for the bitmaps
	//Fill in letters to be recognized
	characterLookup[0] = 'A';
	characterLookup[1] = 'B';
	characterLookup[2] = 'C';
	characterLookup[3] = 'D';
	characterLookup[4] = 'E';
	characterLookup[5] = 'J';
	characterLookup[6] = 'K';
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 7; j++) //Create bitmaps from our existing training files
		{ 
			trainingBitmaps[i * 7 + j] = new Bitmap("resources\\train\\" + to_string(i + 1) + "\\" + characterLookup[j] + ".bmp");
		}
	}
	network.drawWeights(); //Draw the initial weights
	cout << "#############################################" << endl;
	cout << "########### START TRAINING ##################" << endl;
	cout << "#############################################" << endl;
	//Calculate the outputs that correspond to the pictures
	double outputs[21][7];
	for (int i = 0; i < 21; i++)
	{
		for (int j = 0; j < 7; j++)
		{
			if (i % 7 == j) outputs[i][j] = 1;
			else outputs[i][j] = -1;
		}
	}
	double networkError;
	do {
		networkError = 0.0; //Reset the network error
		for (int i = 0; i < 3; i++) //Directory loop
		{
			for (int j = 0; j < 7; j++) //Loop by letters
			{
				//Check if the images are the right size. If not, then end the program.
				if (trainingBitmaps[i * 7 + j]->getWidth() != 7 || trainingBitmaps[i * 7 + j]->getHeight() != 9) {
					cout << "TRAINING ERROR - WRONG IMAGES" << endl;
					exit(1);
				}
				pixel* image = trainingBitmaps[i * 7 + j]->getImage(); //Take pixels from the image
				double inputs[63 * 3]; //Create tables, for entering into the network
				for (int k = 0; k < 63; k++) //Fill in the input tables with pixel colors
				{
					inputs[k * 3] = image[k].red;
					inputs[k * 3 + 1] = image[k].green;
					inputs[k * 3 + 2] = image[k].blue;
				}
				network.train(inputs, outputs[i * 7 + j]); //Start the training for the prepared data
				networkError += network.getError(); //After the training, take the network classification error and add it to the whole error
			}
		}
		cout << "NETWORK ERROR = " << networkError << endl; //Print the network error
	} while (networkError > 0.00000001); //If the error is small enough, let's stop training.
	cout << "#############################################\n";
	cout << "############# END TRAINING ##################\n";
	cout << "#############################################\n\n";
}
LettersPANN::~LettersPANN(void)
{
	if (trainingBitmaps != nullptr) { //Deconstruct the dynamic training bitmaps
		for (int i = 0; i < 21; i++)
		{
			if (trainingBitmaps[i] != nullptr) {
				delete trainingBitmaps[i];
			}
		}
		delete[] trainingBitmaps;
	}
}
void LettersPANN::printNetworkConfiguration() {
	network.printNetworkConfiguration(); //Print the network configuration
}
void LettersPANN::printTestBitmap(Bitmap* bitmap) {
	pixel* image = bitmap->getImage(); //Collect pixels from the image
	double inputs[63 * 3];
	for (int k = 0; k < 63; k++) //Create and fill entry tables
	{
		inputs[k * 3] = image[k].red;
		inputs[k * 3 + 1] = image[k].green;
		inputs[k * 3 + 2] = image[k].blue;
	}
	double outputs[7]; //Create output tables
	network.test(inputs, outputs); //Test the network, give inputs. Then we will get results in the outputs table.
	bitmap->printLetter(); //Print the letter from the bitmap
	cout << "BITMAP TEST RESULTS:" << endl;
	for (int i = 0; i < 7; i++) //Print out the output we received, print matches to the letters
	{
		if (outputs[i] == 1)
		{
			cout << "y" << (i + 1) << " = " << outputs[i];
			cout << "   |(Matched to the letter: " << characterLookup[i] << ")\n";
		}
		else if (outputs[i] == -1)
		{
			cout << "y" << (i + 1) << " = " << outputs[i];
			cout << "  |(Not matched to the letter: " << characterLookup[i] << ")\n";
		}
	}
	cout << "----------------------------\n\n";
}
//The bitmap constructor is loaded from the file named above.
//fileName - file name to load
//image(nullptr) - don't include a table in the initialization list (because we don't know what size it should have)
Bitmap::Bitmap(string fileName) :image(nullptr)
{
	ifstream file(fileName, ios::in | ios::binary); //Open the file for reading in binary form
	if (file.is_open()) { //Check if the file has been opened correctly
		char header[54]; //Secondary array for the file header
		file.read(header, 54); //Load the file header (54 bytes) into the secondary array
		width = *((int*)&header[18]); //Get the bitmap width from the header
		height = *((int*)&header[22]); //Get the bitmap height from the header
		image = new pixel[width * height]; //Create dynamic arrays per pixels (size = width x height)
		for (int i = 0; i < height; i++) //Load pixels from the file, in order
		{
			for (int j = 0; j < width; j++)
			{
				file.peek(); //Download the sign, without removing it
				int index = (height - i - 1) * width + j;
				if (!file.eof()) { //Check if we have reached the end of the file
					image[index].blue = file.get(); //If the end of the file has not been reached
					image[index].green = file.get(); //we read one pixel (3 colors) and write them in an array
					image[index].red = file.get();
				}
				else
				{
					image[index].blue = 0; //If the end of the file has been reached, enter empty pixels
					image[index].green = 0;
					image[index].red = 0;
				}
			}
			if (i < height - 1) { //Read.get the bmp file seperator
				file.get();
				file.get();
				file.get();
			}
		}
		file.close(); //After our operations, close the file
	}
}
Bitmap::~Bitmap(void) //Bitmap Destructor
{
	if (image != nullptr) { //Check if a pixel table has been created
		delete[] image; //If the table exists, delete it
	}
}
void Bitmap::print() { //This function prints subsequent pixels on the screen
	if (image == nullptr) //If the pixels were not loaded correctly
	{
		cout << "Incorrect bitmap" << endl;
		return; //Interrupt the function
	}
	//Print out the bitmap's data
	cout << "Bitmap:" << endl;
	cout << "\theight = " << height << endl;
	cout << "\twidth = " << width << endl;
	for (int i = 0; i < height; i++) //Print out the bitmap's pixels
	{
		cout << "row number = " << i + 1 << endl;
		for (int j = 0; j < width; j++)
		{
			cout << "\tR=" << image[i * width + j].red << " G=" << image[i * width + j].green << " B=" << image[i * width + j].blue << endl;
		}
		cout << endl;
	}
}
void Bitmap::printLetter() { //This function prints the letter
	if (image == nullptr) //If the pixels were not loaded correctly
	{
		cout << "Incorrect bitmap" << endl;
		return; //Interrupt the function
	}
	//Print out the bitmap's data
	cout << "Bitmap height = " << height << endl;
	cout << "Bitmap width = " << width << endl;
	cout << "----------------------------\n";
	for (int i = 0; i < height; i++) //Print out the bitmap's pixels
	{
		for (int j = 0; j < width; j++)
		{
			//Print in binary
			if ((image[i * width + j].red + image[i * width + j].green + image[i * width + j].blue) / 3 < 128) {
				cout << char(219) << char(219);
			}
			else
			{
				cout << "  ";
			}
		}
		cout << endl;
	}
	cout << "----------------------------\n";
}
int Bitmap::getWidth() {
	return width;
}
int Bitmap::getHeight() {
	return height;
}
pixel* Bitmap::getImage() {
	return image;
}
//MAIN FUNCTION
int main(){
	srand((unsigned int)time(NULL)); //Set the seed, to generate pseudo-random numbers
	LettersPANN network(0.01); //Create a network (Learnt/used in the constructor)
	cout << "TEST BITMAPS FROM THE CHECK FOLDER" <<endl; //We are testing on letters from the "check" folder
	char characterLookup[7] = {'A', 'B', 'C', 'D', 'E', 'J', 'K'};
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 7; j++)
		{
			Bitmap test1("resources\\check\\" + to_string(i+1) + "\\" + characterLookup[j] + ".bmp"); //Load the bitmap
			cout << "----------------------------\n";
			cout << "Corrupted character to check: " << characterLookup[j] << endl;
			network.printTestBitmap(&test1); //Check the classification (it will be displayed on the screen)
			cout << "Press ENTER (or ANY KEY) to check the next letter ...\n\n"; //To check the next letter, you need to press enter.
			_getch();
		}
	}
	return 0;
}