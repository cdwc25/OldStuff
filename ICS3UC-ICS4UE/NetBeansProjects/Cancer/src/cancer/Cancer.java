/*
 * Name: Connor Cerisano
 * Date: 2019/03/31
 * Purpose: Recursion Algorithms (U4A2)
 */
package cancer;

import java.io.*;

public class Cancer {

    //Global Variable, create our 15x15 grid
    public static String[][] grid = new String[15][15];

    public static void main(String[] args) throws FileNotFoundException, IOException {
        int blobCount = 0; //Variable to determine the amount of cancer blobs

        //Variables for file reading
        FileReader fr = new FileReader("humanCells.txt");
        BufferedReader br = new BufferedReader(fr);

        //CONVERT TEXT FILE INTO OUR 2D ARRAY
        int lineNo = 0;
        String line = br.readLine();
        while (line != null) { //Only execute code while data exists
            for (int i = 0; i < line.length(); i++) {
                grid[lineNo][i] = line.substring(i, i + 1);
            }
            lineNo++;
            line = br.readLine();
        }

        //Print out our current grid
        displayGrid();

        //Find and remove cancer blobs   
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 15; j++) {
                if (grid[i][j].equals("-")) {
                    blobCount++;
                    floodFill(i, j);
                }
            }
        }

        System.out.println("The file had " + blobCount + " cancer spots in it");
        System.out.println("The new grid is:");
        displayGrid(); //After removing the cancer spots, display the new grid
    }

    public static void floodFill(int row, int col) { //Flood-fill algorithm
        if (grid[row][col].equals("-")) {
            grid[row][col] = " ";
            floodFill(row - 1, col - 1);
            floodFill(row - 1, col);
            floodFill(row - 1, col + 1);
            floodFill(row, col - 1);
            floodFill(row, col + 1);
            floodFill(row + 1, col - 1);
            floodFill(row + 1, col);
            floodFill(row + 1, col + 1);
        }
    }

    public static void displayGrid() { //When this is called, display the grid of cells
        String output = "";
        for (int row = 0; row <= 14; row++) {
            for (int col = 0; col <= 14; col++) {
                output += grid[row][col];
            }
            output += "\n";
        }
        System.out.println(output);
    }
}
