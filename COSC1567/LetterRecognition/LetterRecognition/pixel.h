//Connor Cerisano, c0630428
//2020-02-22
//LetterRecognition: pixel.h

#ifndef PIXEL_H
#define PIXEL_H

//Structure, for storing RGB pixels
struct pixel
{
	//NOTE: short is a type of integer.  
	//A "short" will be optimized for space, and will have width of at least 16 bits.
	short red;
	short green;
	short blue;
};

#endif