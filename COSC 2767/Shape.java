// Connor Cerisano
// 2021-03-04
// COSC 2767
// Midterm Exam, Questions 10 & 11
// Shape Interface

package packageName; //placeholder package name

// A general interface for shape classes.
public interface Shape {
	public double getArea();

	public double getPerimeter();

	// equals method for question 10
	boolean equals(Shape other);
}