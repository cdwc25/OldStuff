// Connor Cerisano
// 2021-03-04
// COSC 2767
// Midterm Exam, Question 10
// Rectangle Class

package packageName; //placeholder package name

//Represents rectangular shapes.
public class Rectangle implements Shape {
	private double width;
	private double height;

	// constructs a new rectangle with the given dimensions
	public Rectangle(double width, double height) {
		this.width = width;
		this.height = height;
	}

	// returns the area of this rectangle
	public double getArea() {
		return width * height;
	}

	// returns the perimeter of this rectangle
	public double getPerimeter() {
		return 2.0 * (width + height);
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