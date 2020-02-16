public class TestLegemiddel {
	public static void main(String[] args) {
		
		Narkotisk kokain = new Narkotisk("Kokain", 15.0, 5.0, 3);
		Vanedannende nikotin = new Vanedannende("Nikotin", 10.0, 3.0, 1);
		Vanlig lecitin = new Vanlig("Lecitin", 18.95, 1.5);
		// Legemiddel shrek = new Legemiddel("Shrek", 1.0, 1.0);

		System.out.println(kokain);
		System.out.println(nikotin);
		System.out.println(lecitin);
	}
}