/*
 * Name: Connor Cerisano
 * Date: 2019/04/18
 * Purpose: Composition (U6A3)
 */
package animalsheltertester;

import javax.swing.JOptionPane;

public class AnimalShelterTester {

    public static void main(String[] args) {
        //Create our animal shelter containing animals
        AnimalShelter myShelter = new AnimalShelter();

        //Menu code (user input)
        String myInput = "";
        while (!myInput.equals("5")) {
            myInput = JOptionPane.showInputDialog(
                    "Please choose from the following menu:\n"
                    + "1 – Display list of dogs\n"
                    + "2 - Add a dog to the shelter\n"
                    + "3 - Remove a dog from the shelter\n"
                    + "4 - Display the operating cost of the shelter\n"
                    + "5 - Exit the program");
            if (myInput.equals("1")) {
                //Display the list of dogs
                System.out.println(myShelter);
            } else if (myInput.equals("2")) {
                myShelter.addDog(); //Add a dog object
            } else if (myInput.equals("3")) {
                String dogNum = JOptionPane.showInputDialog("Which dog # do you wish to adopt?");
                myShelter.adoptDog(Integer.parseInt(dogNum)); //Remove a dog object
            } else if (myInput.equals("4")) {
                myShelter.operatingCost(); //Display the operating cost
            } else {
                //If this code is reached, there was invalid input!
            }
        }
    }

}
