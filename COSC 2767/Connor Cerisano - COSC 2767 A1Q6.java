// Connor Cerisano
// 2021-02-26
// COSC 2767
// Assignment 1, Question 6

package packageName; //placeholder package name

import java.util.*; //Contains classes useful for managing input

//Main class
public class Main {
	// Main function
	public static void main(String[] args) {

		// Get student number from user
		Scanner console = new Scanner(System.in);
		System.out.print("Student Number: ");
		String number = console.next();
		console.close();

		int checkDigit = 0; // Variable for check digit calculation

		// Make sure number is 6 digits in length
		if (number.length() != 6)
			throw new IllegalArgumentException();

		// Calculate the check digit of our 6 digit student number
		for (int i = 0; i < number.length(); i++) {
			// Variable 'number' is converted to char so each digit can be used,
			// then converted back so checkDigit has a numeric value
			checkDigit += (i + 1) * Character.getNumericValue(number.charAt(i));
		}

		// Display the check digit
		System.out.println(checkDigit % 10);
	}
}
