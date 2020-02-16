public class TestResepter {
	public static void main(String[] args) {
		Legemiddel kokain = new Narkotisk("Kokain", 15.0, 5.0, 3);
		Lege lege = new Lege("Frankenstein");
		int samplePasient = 500;
		int sampleReit = 5;

		HvitResept hvitresept = new HvitResept(kokain, lege, samplePasient, sampleReit);
		System.out.println(hvitresept);

		Resept blaaresept = new BlaaResept(kokain, lege, samplePasient, sampleReit);
		System.out.println(blaaresept);
		
		MResept mresept = new MResept(kokain, lege, samplePasient, sampleReit);
		System.out.println(mresept);

		Legemiddel kondomer = new Vanlig("Kondomer", 300.0, 5.0);
		PResept presept = new PResept(kondomer, lege, samplePasient);
		System.out.println(presept);
	}
}