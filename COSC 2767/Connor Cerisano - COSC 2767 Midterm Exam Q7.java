// Connor Cerisano
// 2021-03-02
// COSC 2767
// Midterm Exam, Question 7

package packageName; //placeholder package name

// Main class
public class Main {
	// Main function
	public static void main(String[] args) {
		// Mark 6 columns in total
		for (int x = 0; x < 6; x++) {
			for (int y = 0; y < 9; y++) {
				System.out.print(" "); // print 9 spaces
			}
			System.out.print("|"); // after 9 spaces occur, mark a column
		}
		System.out.println(); // next line
		for (int z = 1; z <= 6; z++) {
			System.out.print("1234567890"); // print numbers
		}
	}
}