//Connor Cerisano, c0630428
//2020-02-22
//LetterRecognition: Bitmap.h

#ifndef BITMAP_H
#define BITMAP_H

#include "pixel.h"
#include <string>
#include <fstream>
#include <iostream>

using namespace std;

//Class for bitmap support (.bmp)
class Bitmap
{
private:
	//Image width
	int width;

	//Image height
	int height;

	//Dynamic array with image pixels
	pixel* image;
public:
	//Constructor to load the image from the file with the extension .bmp
	Bitmap(string fileName);

	//Deconstructor for destroying the pixel table
	~Bitmap(void);

	//Function that prints the values of the next pixels of the image on the screen
	void print();

	//Function to print the letter
	void printLetter();

	//Function to download image width
	int getWidth();

	//Function to retrieve image height
	int getHeight();

	//Function to retrieve image pixel array
	pixel* getImage();
};

#endif

