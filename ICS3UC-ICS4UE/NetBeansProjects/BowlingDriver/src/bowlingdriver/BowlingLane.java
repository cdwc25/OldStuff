/*
 * Name: Connor Cerisano
 * Date: 3/5/2019
 * Purpose: Bowling Lane Class (U3A2: Modifying Modules)
 */
package bowlingdriver;

public class BowlingLane {

    //Properties (Variables)
    boolean[] pinState = new boolean[5];
    int[] pinValue = new int[5];
    int pinValueTotal = 0;

    //Constructor 1 (Default, in case BowlingLane() was ever called without properties.)
    public BowlingLane() {
        //Set all pins to FALSE, or UP
        for (int i = 0; i < 5; i++) {
            pinState[i] = false;
        }

        //Assign Pin Values
        pinValue[0] = 2;
        pinValue[1] = 3;
        pinValue[2] = 5;
        pinValue[3] = 3;
        pinValue[4] = 2;
        pinValueTotal = 0;
    }

    //Constructor 2 (Assigning ALL Properties.)
    public BowlingLane(String pS1, String pS2, String pS3, String pS4, String pS5) {
        //Assign Pin Values
        pinValue[0] = 2;
        pinValue[1] = 3;
        pinValue[2] = 5;
        pinValue[3] = 3;
        pinValue[4] = 2;
        pinValueTotal = 0;

        //Get state of each pin, calculate & display total
        if (pS1.equalsIgnoreCase("DOWN")) {
            pinState[0] = true; //True = down
            pinValueTotal += pinValue[0];
        }
        if (pS2.equalsIgnoreCase("DOWN")) {
            pinState[1] = true;
            pinValueTotal += pinValue[1];
        }
        if (pS3.equalsIgnoreCase("DOWN")) {
            pinState[2] = true;
            pinValueTotal += pinValue[2];
        }
        if (pS4.equalsIgnoreCase("DOWN")) {
            pinState[3] = true;
            pinValueTotal += pinValue[3];
        }
        if (pS5.equalsIgnoreCase("DOWN")) {
            pinState[4] = true;
            pinValueTotal += pinValue[4];
        }
    }

    //toString() method. Called to display all info of the lane.
    public String toString() {
        String output = ""; //Initialize output so we can add to it/display it later
        output += "Here are your results! Each number represents a pin. If a pin is up, it's a zero. If it's down, it's 1.\n-------------------------------------\n";

        //Output state of each pin. 1 for down, 0 for up.
        for (int i = 0; i < 5; i++) {
            if (pinState[i] == true) {
                output += "1          ";
            } else {
                output += "0          ";
            }
        }

        //Detect the configuration of our lane. Check for each situation. Did we get a headsplit, an ace, or a strike?
        if (pinState[0] == false && pinState[1] == true && pinState[2] == true && pinState[3] == false && pinState[4] == false) {
            output += "(HS - Headsplit)";
        }
        if (pinState[0] == false && pinState[1] == false && pinState[2] == true && pinState[3] == true && pinState[4] == false) {
            output += "(HS - Headsplit)";
        }
        if (pinState[0] == false && pinState[1] == true && pinState[2] == true && pinState[3] == true && pinState[4] == false) {
            output += "(A - Aces)";
        }
        if (pinState[0] == true && pinState[1] == true && pinState[2] == true && pinState[3] == true && pinState[4] == true) {
            output += "(X - Strike)";
        }

        //Display our Pin Total
        output += "\n-------------------------------------\nYour total score is: " + pinValueTotal;

        return output; //toString() will now return whatever our output is.
    }
}
