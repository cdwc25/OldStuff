// Connor Cerisano
// 2021-02-26
// COSC 2767
// Assignment 1, Question 7

package packageName; //placeholder package name

//Main class
public class BankAccount {
	String name;
	double balance;
	double transactionFee = 5; // transactionFee field for the BankAccount class

	public void deposit(double amount) {
		balance = balance + amount;
	}

	public void withdraw(double amount) {
		balance = balance - amount;
	}

	// toString method for BankAccount class
	public String toString() {
		String pad = "";

		// Separate integer part from decimal part
		int temp = (int) (balance * 100);
		int integer = temp / 100;
		int decimal = temp % 100;

		// If the decimal part is less than 10, make it zero.
		// Otherwise, pad will be empty and decimal will display accurately
		if (decimal < 10)
			pad = "0";

		return name + ", " + "$" + integer + "." + pad + decimal;
	}

	// transfer method for BankAccount class
	public void transfer(BankAccount ba, double money) {
		// No transfer should occur if account is out of money
		if (balance < transactionFee || money <= 0)
			return;

		if (balance < transactionFee + money) {
			ba.deposit(balance - transactionFee);
			this.withdraw(balance);
		} else { // Transfer whatever money is left if full transfer cannot be made
			ba.deposit(money);
			this.withdraw(transactionFee + money);
		}
	}

	// Driver function
	public static void main(String[] args) {

		BankAccount ben = new BankAccount();
		ben.name = "Ben";
		BankAccount hal = new BankAccount();
		hal.name = "Hal";
		System.out.println("Ben and Hal accounts created.");

		ben.deposit(80.00);
		hal.deposit(20.00);
		System.out.println("Ben deposits 80.00, Hal deposits 20.00");
		System.out.println(ben.toString());
		System.out.println(hal.toString());

		ben.transfer(hal, 20.00);
		System.out.println("Ben transfers 20.00 to Hal.");
		System.out.println(ben.toString());
		System.out.println(hal.toString());

		ben.transfer(hal, 10.00);
		System.out.println("Ben transfers 10.00 to Hal.");
		System.out.println(ben.toString());
		System.out.println(hal.toString());

		hal.transfer(ben, 60.00);
		System.out.println("Hal transfers 60.00 to Ben.");
		System.out.println(ben.toString());
		System.out.println(hal.toString());
	}
}
