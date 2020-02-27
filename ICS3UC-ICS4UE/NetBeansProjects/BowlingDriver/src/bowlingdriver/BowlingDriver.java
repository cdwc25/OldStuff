/*
 * Name: Connor Cerisano
 * Date: 3/5/2019
 * Purpose: Bowling Driver (U3A2: Modifying Modules) 
 */
package bowlingdriver;

import javax.swing.JOptionPane;

public class BowlingDriver {

    public static void main(String[] args) {
        //Create our BowlingLane
        BowlingLane BL;

        String pS1 = JOptionPane.showInputDialog("Imagine a bowling lane with 5 pins. Each pin can be UP or DOWN. Is pin #1 UP or DOWN?");
        String pS2 = JOptionPane.showInputDialog("Imagine a bowling lane with 5 pins. Each pin can be UP or DOWN. Is pin #2 UP or DOWN?");
        String pS3 = JOptionPane.showInputDialog("Imagine a bowling lane with 5 pins. Each pin can be UP or DOWN. Is pin #3 UP or DOWN?");
        String pS4 = JOptionPane.showInputDialog("Imagine a bowling lane with 5 pins. Each pin can be UP or DOWN. Is pin #4 UP or DOWN?");
        String pS5 = JOptionPane.showInputDialog("Imagine a bowling lane with 5 pins. Each pin can be UP or DOWN. Is pin #5 UP or DOWN?");

        BL = new BowlingLane(pS1, pS2, pS3, pS4, pS5); //"Instantiate" our bowling lane object once we have our values
        
        JOptionPane.showMessageDialog(null, BL.toString()); //Display our final results, using toString().
    }

}
