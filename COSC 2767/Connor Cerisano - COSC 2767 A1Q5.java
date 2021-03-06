// Connor Cerisano
// 2021-02-26
// COSC 2767
// Assignment 1, Question 5

package packageName; //placeholder package name

import java.io.*; //Contains classes to perform input and output
import java.util.*; //Contains classes useful for managing input

//Main class
public class Main {
	// Main function, catch file not found errors
	public static void main(String[] args) throws FileNotFoundException {

		// Variables
		String first = "", second = "";
		String firstName = "data1", secondName = "data2"; // file names

		// Read files
		Scanner input1 = new Scanner(new File(firstName)); // read first file
		Scanner input2 = new Scanner(new File(secondName)); // read second file

		// Check for differences while lines exist
		while (input1.hasNextLine() && input2.hasNextLine()) {
			first = input1.nextLine();
			second = input2.nextLine();

			// If a difference is found... print out each line to show the difference.
			if (!first.equals(second)) {
				System.out.println("Differences found: " + "\n" + first + '\n' + second);
			}
		}
	}
}