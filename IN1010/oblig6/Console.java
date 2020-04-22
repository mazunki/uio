import java.util.Scanner;

public class Console {
	public static String getString() {
		return (new Scanner(System.in)).nextLine();
	}

	public static String getString(String s) {
		System.out.println(s);
		return getString();
	}

	public static void clearScreen() { 
		try {
			String os = System.getProperty("os.name").toLowerCase();
			if (os.contains("win")) {
				Runtime.getRuntime().exec("cls");
			} else {
				System.out.println();
				System.out.print("\033[H\033[2J");  
				System.out.flush();
			}
		} catch (Exception e) {
			String manyLines = new String(new char[20]).replace("\0", "\n");
			System.out.println(manyLines);
		}
	}

	public static void waitForEnter() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Press <Enter> to continue.");
		scanner.nextLine();
	}
}
