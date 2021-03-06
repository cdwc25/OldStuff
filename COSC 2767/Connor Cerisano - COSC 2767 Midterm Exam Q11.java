// Connor Cerisano
// 2021-03-04
// COSC 2767
// Midterm Exam, Question 11
// Octagon Class

package packageName; //placeholder package name

//Represents an octagon.
public class Octagon implements Shape {
	private double side; // 8 sides have same length

	// constructs a new octagon
	public Octagon(double side) {
		this.side = side;
	}

	// returns the area of the octagon
	public double getArea() {
		return (2 * (1 + Math.sqrt(2)) * side * side);
	}

	// returns the perimeter of the octagon
	public double getPerimeter() {
		return side * 8;
	}

	// equals method
	public boolean equals(Shape other) {
		// If area and perimeter are the same, width and height must be the same.
		if (getArea() == other.getArea() && getPerimeter() == other.getPerimeter())
			return true;
		else // Otherwise, shape does not equal the other shape
			return false;
	}
}