#include <iostream>
#include <vector>
#include <conio.h>
using namespace std;

int main( )
{
    vector<int> v;
    cout << "Enter a list of positive numbers.\n"
         << "Place a negative number at the end.\n";

    int next;
    cin >> next;
    while (next > 0)
    {
        v.push_back(next);
		/*std::vector::push_back
void push_back (const value_type& val);
Adds a new element at the end of the vector, after its current last element. 
The content of val is copied (or moved) to the new element.
This effectively increases the container size by one, which causes an automatic reallocation 
of the allocated storage space if -and only if- the new vector size surpasses the current vector capacity.
*/
        cout << next << " added. ";
        cout << "v.size( ) = " << v.size( ) << endl;
		/*std::vector::size
size_type size() const;
Returns the number of elements in the vector.
This is the number of actual objects held in the vector, which is not necessarily equal to its storage capacity.
*/
        cin >> next;
    }

    cout << "You entered:\n";
    for (unsigned int i = 0; i < v.size( ); i++)
        cout << v[i] << " ";
    cout << endl;
	_getch();

    return 0;
}