// Connor Cerisano
// 2021-03-04
// COSC 2767
// Midterm Exam, Question 9

package packageName; //placeholder package name

import java.util.*; //Contains classes useful for managing input

// Main class
public class Main {

	// Main function
	public static void main(String[] args) {
		// Get name from user
		Scanner console = new Scanner(System.in);

		System.out.print("First name: ");
		String firstName = console.next();

		System.out.print("Last name: ");
		String lastName = console.next();

		console.close(); // close console once we are done

		// Call the song method, perform the song
		song(firstName, lastName);
	}

	// Method to perform song
	public static void song(String fn, String ln) {
		String firstName = fn;
		String lastName = ln;
		System.out.println();

		// Cut first letter off first and last name
		String firstSuffix = firstName.substring(1);
		String lastSuffix = lastName.substring(1);

		// Perform song for first name
		System.out.println(firstName + ", " + firstName + ", bo-b" + firstSuffix);
		System.out.println("Bonana-fanna fo-f" + firstSuffix);
		System.out.println("Fee fi mo-m" + firstSuffix);
		System.out.println(firstName + "!");

		System.out.println();

		// Perform song for last name
		System.out.println(lastName + ", " + lastName + ", bo-b" + lastSuffix);
		System.out.println("Bonana-fanna fo-f" + lastSuffix);
		System.out.println("Fee fi mo-m" + lastSuffix);
		System.out.println(lastName + "!");
	}
}