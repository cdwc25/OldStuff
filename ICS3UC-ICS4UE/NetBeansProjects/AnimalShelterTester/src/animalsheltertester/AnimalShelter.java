/*
 * Name: Connor Cerisano
 * Date: 2019/04/18
 * Purpose: Composition: Animal Shelter Class (U6A3)
 */
package animalsheltertester;

import java.util.ArrayList;
import javax.swing.JOptionPane;

public class AnimalShelter {

    private ArrayList dogs = new ArrayList<Dog>(); //Use ArrayList instead of array; dynamic in size

    public AnimalShelter() { //Default constructor; create animals for shelter
        fillDogs();
    }

    public void fillDogs() {
        //Ask for how many dogs to fill the shelter
        String myInput = JOptionPane.showInputDialog("Welcome to the shelter creator!\nHow many dogs would you like to put in the shelter?");
        int numDogs = Integer.valueOf(myInput);

        String name, breed, age, weight; //Variables to ask for each animal property
        //Loop based on how many dogs the user wants to create
        for (int i = 0; i < numDogs; i++) {
            name = JOptionPane.showInputDialog("What is dog #" + (i + 1) + "'s name?");
            breed = JOptionPane.showInputDialog("What is dog #" + (i + 1) + "'s breed?");
            age = JOptionPane.showInputDialog("What is dog #" + (i + 1) + "'s age?");
            weight = JOptionPane.showInputDialog("What is dog #" + (i + 1) + "'s weight?");
            dogs.add(new Dog(name, breed, Integer.valueOf(age), Integer.valueOf(weight))); //Create the individual dog object
        }
    }

    public void adoptDog(int num) {
        dogs.remove(num); //Remove the specified dog from the shelter
    }

    public void addDog() {
        //Ask user for animal's properties
        String name, breed, age, weight;
        name = JOptionPane.showInputDialog("Dog Name?");
        breed = JOptionPane.showInputDialog("Dog Breed?");
        age = JOptionPane.showInputDialog("Dog Age?");
        weight = JOptionPane.showInputDialog("Dog Weight?");
        dogs.add(new Dog(name, breed, Integer.valueOf(age), Integer.valueOf(weight))); //Add the dog to the shelter
    }

    public void operatingCost() {
        int oc = dogs.size() * 15; //Calculation: 15 dollars per dog.
        System.out.println("Shelter's current operating cost: $" + oc + " per day.");
    }

    public String toString() {
        String output = "";
        output += "Shelter Contains:\n";
        //Print each dog's stats out
        for (int i = 0; i < dogs.size(); i++) {
            output += "Dog #" + i + "\n";
            output += dogs.get(i).toString() + "\n";
        }
        return output;
    }
}
