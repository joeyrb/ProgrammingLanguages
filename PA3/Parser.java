// Import Java Scanner class to read command line input
import java.util.Scanner;

public class Parser 
{
	public static void main(String[] Args)
	{
		
		// scanner object to read command-line input
		Scanner scanner = new Scanner(System.in);

		// prompt for user input
		System.out.print("Expression: ");

		// use scanner to get input as a string
		String expression = scanner.next();

		System.out.println(expression);
	}
}