import java.security.AccessControlException;

public class Main {
	public static void main(String[] args) {
		int minPasient = 100;
		int minAndrePasient = 101;

		Lege minFastlege = new Lege("Van Rossum");  // navn
		Spesialist minSuperlege = new Spesialist("Frankenstein", 123456);  // navn, kontrollID
		
		// Legemiddel abstractLegemiddel = new Legemiddel(...);
		Narkotisk kokain = new Narkotisk("Kokain", 10000.00, 3.5, 100);  // navn, pris, virkestoff (mg), styrke
		Vanedannende nikotin = new Vanedannende("Nikotin", 300.00, 10.0, 10);  // navn, pris, virkestoff (mg), styrke
		Vanlig lecitin = new Vanlig("Lecitin", 400.00, 10.0);  // navn, pris, virkestoff (mg)
		Vanlig paracetamol = new Vanlig("Paracetamol", 100.00, 10.0);  // navn, pris, virkestoff (mg)
		Vanlig prevensjon = new Vanlig("Kondomer", 300, 10);
		
		// Resept abstractResept = new Resept(...);
		HvitResept minLecitinResept = new HvitResept(lecitin, minFastlege, minPasient, 10); // legemiddel, lege, pasient, reit
		MResept minMiliterResept = new MResept(kokain, minSuperlege, minAndrePasient, 2);  // legemiddel, lege, pasient, reit
		PResept brukPrevensjonPlease = new PResept(prevensjon, minFastlege, minPasient);  // legemiddel, lege, pasient
		PResept sexualHealthErViktig = new PResept(prevensjon, minFastlege, minAndrePasient);  // legemiddel, lege, pasient
		HvitResept minDyreNikotinResept = new HvitResept(nikotin, minSuperlege, minAndrePasient, 10);  // legemiddel, lege, pasient, reit
		BlaaResept minBilligeNikotinResept = new BlaaResept(nikotin, minSuperlege, minAndrePasient, 10);  // legemiddel, lege, pasient, reit
		MResept minVeldigBilligeNikotinResept = new MResept(nikotin, minSuperlege, minAndrePasient, 10);  // legemiddel, lege, pasient, reit

		try {
			MResept minUlovligeMiliterResept = new MResept(kokain, minFastlege, minAndrePasient, 2);  // legemiddel, lege, pasient, reit
		} catch (AccessControlException e) {
			System.out.println("Error! " + e.getMessage() + "\n");
		}

		System.out.println("Mine doktorer: ");
		System.out.println(minFastlege);
		System.out.println(minSuperlege);
		System.out.println();
		
		System.out.println("Mine medisiner: ");
		System.out.println(kokain);
		System.out.println(nikotin);
		System.out.println(lecitin);
		System.out.println(paracetamol);
		System.out.println(prevensjon);
		System.out.println();

		System.out.println("Mine resepter: ");
		System.out.println(minLecitinResept);
		System.out.println(minMiliterResept);
		System.out.println(brukPrevensjonPlease);
		System.out.println(sexualHealthErViktig);
		System.out.println(minDyreNikotinResept);
		System.out.println(minBilligeNikotinResept);
		System.out.println(minVeldigBilligeNikotinResept);
		System.out.println();

	}
}