// Connor Cerisano
// Lab 7-3
// 2020-03-12

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>
#include <string.h>

using namespace std; //Added a namespace so we can use cin and cout correctly

class Player;

class League
{
	friend int canPlayerJoin(Player aPlayer, League aLeague);

private:
	char leagueName[35];
	int minimumAge;
	int maximumAge;

public:
	void setValues(const char ln[], int min, int max); //Added const, renamed leagueName
	void displayValues();
};

void League::setValues(const char ln[], int min, int max) //Added const, renamed leagueName
{
	int temp;
	strcpy_s(leagueName, ln); //strcpy is deprecated, use strcpy_s instead
	if (min > max)
	{
		temp = min;
		min = max;
		max = temp;
	}
	minimumAge = min;
	maximumAge = max;
}

void League::displayValues()
{
	cout << leagueName << " Minimum age: " << minimumAge << " Maximum age: " << maximumAge << endl;
}

class Player
{
	friend int canPlayerJoin(Player aPlayer, League aLeague);

private:
	char name[20];
	int age;

public:
	void setValues(const char playerName[], int playerAge);
};

//Removed the capital L here
void Player::setValues(const char playerName[], int playerAge)
{
	strcpy_s(name, playerName);
	age = playerAge;
}

//"Broadened" the scope of this function
int canPlayerJoin(Player aPlayer, League aLeague)
{
	int leagueFlag = 0;
	if (aPlayer.age >= aLeague.minimumAge && aPlayer.age <= aLeague.maximumAge)
		leagueFlag = 1;
	return(leagueFlag);
}

void main()
{
	int x;
	League aLeague[9]; //Changed size of array since aLeague[8] was being called
	Player aPlayer;

	aLeague[0].setValues("PeeWee Softball", 4, 6);
	aLeague[1].setValues("PeeWee Soccer", 4, 7);
	aLeague[2].setValues("Shooting Stars Soccer", 7, 10);
	aLeague[3].setValues("White Lightning Basketball", 6, 9);
	aLeague[4].setValues("Track Trekkers", 9, 11);
	aLeague[5].setValues("Junior Shots", 11, 14);
	aLeague[6].setValues("Senior Shots", 12, 16);
	aLeague[7].setValues("Travelling Homers", 13, 17);
	aLeague[8].setValues("Key Trotters", 14, 18);
	aPlayer.setValues("Katie", 7);

	cout << "Acceptable Leagues this player can join: " << endl;

	//Added brackets here just in case
	for (x = 0; x < 8; ++x) 
	{
		if (canPlayerJoin(aPlayer, aLeague[x]))
		{
			aLeague[x].displayValues();
		}
	}
	_getch(); //getch(); is deprecated, use _getch(); instead
}


