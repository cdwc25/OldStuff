// Connor Cerisano
// 2021-03-02
// COSC 2767
// Midterm Exam, Question 8

package packageName; //placeholder package name

// Main class
public class Main {
	// Class constants
	public static int columns = 10;
	public static int range = 5;

	// Main function
	public static void main(String[] args) {
		// Mark the appropriate number of columns
		for (int x = 0; x < columns; x++) {
			for (int y = 0; y < range - 1; y++) {
				System.out.print(" "); // print "range" spaces until a column is marked
			}
			System.out.print("|"); // mark a column
		}
		System.out.println(); // next line
		// print the total amount of numbers
		for (int z = 1; z <= columns * range; z++)
			System.out.print(z % range); //z mod range will count up, then reach zero, repeat
	}
}