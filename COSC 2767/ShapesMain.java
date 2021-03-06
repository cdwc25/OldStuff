// Connor Cerisano
// 2021-03-04
// COSC 2767
// Midterm Exam, Questions 10 & 11
// Shapes Driver Program

package packageName; //placeholder package name

public class ShapesMain {
	// Main function
	public static void main(String[] args) {
		Shape[] shapes = new Shape[3]; // Create two example shapes

		// Test equals method for question 10
		shapes[0] = new Rectangle(30, 30);
		shapes[1] = new Rectangle(30, 30);
		shapes[2] = new Octagon(30);

		// Print details about shapes (area, perimeter, equals)
		System.out.println("Rectangles: ");
		System.out.println("area = " + shapes[0].getArea() + ", perimeter = " + shapes[0].getPerimeter());
		System.out.println("area = " + shapes[1].getArea() + ", perimeter = " + shapes[1].getPerimeter());
		System.out.println("Shapes are equal: " + shapes[0].equals(shapes[1]));

		System.out.println("Octagon: ");
		System.out.println("area = " + shapes[2].getArea() + ", perimeter = " + shapes[2].getPerimeter());
	}
}