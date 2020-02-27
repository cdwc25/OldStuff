/*
 * Name: Connor Cerisano
 * Date: 2019/04/18
 * Purpose: Composition: Dog Class (U6A3)
 */
package animalsheltertester;

public class Dog {

    private String name, breed;
    private int age, weight;

    public Dog(String n, String b, int a, int w) {
        name = n;
        breed = b;
        age = a;
        weight = w;
    }

    public String toString() {
        String output = "";
        output += "Name: " + name + "\n";
        output += "Breed: " + breed + "\n";
        output += "Age: " + age + "\n";
        output += "Weight: " + weight + "\n";
        return output;
    }
}
