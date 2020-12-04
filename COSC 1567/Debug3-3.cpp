// Connor Cerisano, 0630428, 2020-02-03, Lab 3

// DEBUG 3-3
// decides if word is in first or last half of alphabet

//Library iostream.h doesn't exist, but iostream does!
#include <iostream>
#include<conio.h>

//We need a namespace to use cin and cout correctly
using namespace std;

void main()
{
    char word[20];
    cout << "Enter a word ";
    cin >> word;

    //cout and endl were spelled wrong... spelling matters!!!!!!!
    //Added a for statement to cycle and analyze each letter of the word
    for (int x = 0; x <= 19; ++x) {
        //Added some more conditions, to make sure that empty values of the array are not being evaluated
        if (word[x] <= 'm' && word[x] > 65 && word[x] < 122) {
            cout << word[x] << " is in the first half of the alphabet" << endl;
        }
        else if (word[x] >= 'm' && word[x] > 65 && word[x] < 122) {
            cout << word[x] << " is in the last half of the alphabet" << endl;
        }
    }
    _getch(); //getch(); is deprecated, use _getch(); instead
}


