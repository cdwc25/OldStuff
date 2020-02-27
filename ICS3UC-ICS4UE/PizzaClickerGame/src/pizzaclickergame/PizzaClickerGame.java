/*
 * Name: Connor Cerisano
 * Date: 2019/06/10
 * Purpose: FINAL PROJECT ("Pizza" Clicker Game)
 */
package pizzaclickergame;

import java.awt.Color;
import javax.swing.*;

public class PizzaClickerGame {

    //Slice count-and-display variables
    long sliceCount = 0; //The big pizza slice count!
    long sps = 0; //Variable to show the user our slices made per second
    public static final Color DARK_GREEN = new Color(0, 102, 0); //Custom color for buyable upgrades
    String output; //Output string; used to set JButton and JLabel text

    //---------UPGRADE VARIABLES--------- (Count # of upgrades bought. Set each upgrade's starting price.)
    long cPower = 1; //Special variable to track clicking "power". Starts at 1 to represent a regular click.
    long cCost = 10;
    long cAmount = 0;
    long ovens = 0;
    long oCost = (20 + ((int) Math.pow(ovens, 2)));
    long bakeries = 0;
    long bCost = (100 + ((int) Math.pow(bakeries, 3)));
    long employees = 0;
    long eCost = (5000 + ((int) Math.pow(employees, 4)));
    long trucks = 0;
    long tCost = (10000 + ((int) Math.pow(trucks, 5)));
    long conglomerates = 0;
    long coCost = (100000 + ((int) Math.pow(conglomerates, 6)));
    long empires = 0;
    long emCost = (500000 + ((int) Math.pow(empires, 7)));
    long worlds = 0;
    long wCost = (50000000 + ((int) Math.pow(worlds, 8)));
    //----------------------------------

    public static void main(String[] args) {
        mainScreen myscreen = new mainScreen(); //Create and initiate the main JPanel called mainScreen.
    }

    public void updateTextColors(JButton buttonName, int uN) { //Method to update the price colors of each upgrade
        long uC = 0; //Change this variable based on what upgrade is being called

        //Given upgrade number corresponds to an upgrade cost
        if (uN == 0) {
            uC = cCost;
        }
        if (uN == 1) {
            uC = oCost;
        }
        if (uN == 2) {
            uC = bCost;
        }
        if (uN == 3) {
            uC = eCost;
        }
        if (uN == 4) {
            uC = tCost;
        }
        if (uN == 5) {
            uC = coCost;
        }
        if (uN == 6) {
            uC = emCost;
        }
        if (uN == 7) {
            uC = wCost;
        }

        //UPDATE TEXT COLORS
        if (sliceCount < uC) {
            buttonName.setForeground(Color.RED);
        } else if (sliceCount >= uC) {
            buttonName.setForeground(DARK_GREEN);
        }
    }

    public void updateSliceCount() { //Method to increase slice count (inside the slice timer)
        sliceCount = sliceCount + sps;
    }

    public void displaySliceCount(JLabel labelName) { //Method to display our current slice count
        output = "Pizza Slice Count: " + sliceCount;
        labelName.setText(output);
    }

    public void displaySlicesPerSecond(JLabel labelName) { //Method to display the slices we make per second
        output = "Slices Per Second: " + sps;
        labelName.setText(output);
    }

    public void pizzaClick() { //Method to calculate our new pizza value once the pizza button has been clicked
        sliceCount = sliceCount + cPower;
    }

    //------------UPGRADE METHODS------------
    public void upgradeClickPower(JButton b) {
        if (sliceCount >= cCost) { //Only buy upgrade if user can afford it.
            cAmount++; //Log the amount of cPower upgrades bought by the user
            cPower++; //Increase the Click Power upgrade everytime this button is clicked
            sliceCount = sliceCount - cCost; //Purchase the upgrade.
            cCost = cCost + 10; //Increase cost of upgrade once bought

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Click Power (Cost: " + cCost + " slices) || Click power: +" + cPower + " per click. || Times bought: " + cAmount);
        }
    }

    public void upgradeOven(JButton b) {
        oCost = (20 + ((int) Math.pow(ovens + 1, 2))); //Set upgrade cost

        if (sliceCount >= (20 + ((int) Math.pow(ovens, 2)))) {
            ovens++; //Create one "oven" upgrade everytime this button is clicked
            sps++; //This upgrade gives us only one extra slice per second.
            sliceCount = sliceCount - (20 + ((int) Math.pow(ovens - 1, 2))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Oven (Cost: " + oCost + " slices) || You currently own " + ovens + " ovens, giving you " + ovens + " slice(s) per second.");
        }
    }

    public void upgradeBakery(JButton b) {
        bCost = (100 + ((int) Math.pow(bakeries + 1, 3))); //Set upgrade cost

        if (sliceCount >= (100 + ((int) Math.pow(bakeries, 3)))) {
            bakeries++; //Create one "bakery" upgrade everytime this button is clicked
            sps = sps + 10; //This upgrade gives us 10 extra slices per second.
            sliceCount = sliceCount - (100 + ((int) Math.pow(bakeries - 1, 3))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Bakery (Cost: " + bCost + " slices) || You currently own " + bakeries + " bakeries, giving you " + (bakeries * 10) + " slice(s) per second.");
        }
    }

    public void upgradeEmployee(JButton b) {
        eCost = (5000 + ((int) Math.pow(employees + 1, 4))); //Set upgrade cost

        if (sliceCount >= (5000 + ((int) Math.pow(employees, 4)))) {
            employees++; //Create one "employee" upgrade everytime this button is clicked
            sps = sps + 100; //This upgrade gives us 100 extra slices per second.
            sliceCount = sliceCount - (5000 + ((int) Math.pow(employees - 1, 4))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Employee (Cost: " + eCost + " slices) || You currently own " + employees + " employees, giving you " + (employees * 100) + " slice(s) per second.");
        }
    }

    public void upgradeTruck(JButton b) {
        tCost = (10000 + ((int) Math.pow(trucks + 1, 5))); //Set upgrade cost

        if (sliceCount >= (10000 + ((int) Math.pow(trucks, 5)))) {
            trucks++; //Create one "truck" upgrade everytime this button is clicked
            sps = sps + 800; //This upgrade gives us 800 extra slices per second.
            sliceCount = sliceCount - (10000 + ((int) Math.pow(trucks - 1, 5))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Pizza Truck (Cost: " + tCost + " slices) || You currently own " + trucks + " trucks, giving you " + (trucks * 800) + " slice(s) per second.");
        }
    }

    public void upgradeConglomerate(JButton b) {
        coCost = (100000 + ((int) Math.pow(conglomerates + 1, 6))); //Set upgrade cost

        if (sliceCount >= (100000 + ((int) Math.pow(conglomerates, 6)))) {
            conglomerates++; //Create one "conglomerate" upgrade everytime this button is clicked
            sps = sps + 10000; //This upgrade gives us 10000 extra slices per second.
            sliceCount = sliceCount - (100000 + ((int) Math.pow(conglomerates - 1, 6))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Conglomerate (Cost: " + coCost + " slices) || You currently own " + conglomerates + " conglomerates, giving you " + (conglomerates * 10000) + " slice(s) per second.");
        }
    }

    public void upgradeEmpire(JButton b) {
        emCost = (500000 + ((int) Math.pow(empires + 1, 7))); //Set upgrade cost

        if (sliceCount >= (500000 + ((int) Math.pow(empires, 7)))) {
            empires++; //Create one "empire" upgrade everytime this button is clicked
            sps = sps + 100000; //This upgrade gives us 100000 extra slices per second.
            sliceCount = sliceCount - (500000 + ((int) Math.pow(empires - 1, 7))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Empire (Cost: " + emCost + " slices) || You currently own " + empires + " empires, giving you " + (empires * 100000) + " slice(s) per second.");
        }
    }

    public void upgradeWorld(JButton b) {
        wCost = (50000000 + ((int) Math.pow(worlds + 1, 8))); //Set upgrade cost

        if (sliceCount >= (50000000 + ((int) Math.pow(worlds, 8)))) {
            worlds++; //Create one "pizza world" upgrade everytime this button is clicked
            sps = sps + 10000000; //This upgrade gives us 10000000 extra slices per second.
            sliceCount = sliceCount - (50000000 + ((int) Math.pow(worlds - 1, 8))); //Purchase the upgrade. Subtract from our slice count.

            //Update our statistics, to show to the user.
            b.setText("UPGRADE: Pizza World (Cost: " + wCost + " slices) || You currently own " + worlds + " pizza worlds, giving you " + (worlds * 10000000) + " slice(s) per second.");
        }
    }
}
