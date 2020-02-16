abstract class Legemiddel {
	private int quantity;
	private int id;
	static private int counter=0;
	private String navn;
	private double virkestoff;
	private double pris;

	protected Legemiddel(String navn, double pris, double virkestoff) {
		this.navn = navn;
		this.pris = pris;
		this.virkestoff = virkestoff;
		this.id = counter;
		counter++;
	}

	public int hentId(){
		return this.id;
	}

	public String hentNavn() {
		return this.navn;
	}

	public double hentPris() {
		return this.pris;
	}

	public double hentVirkestoff() {
		return this.virkestoff;
	}

	public void settNyPris(double nyPris) {
		this.pris = nyPris;
	}

	public String toString() {
		String stringOut = this.virkestoff + "mg of " + this.navn + " with id " + this.id + " with price " + this.pris;
		return stringOut;
	}
}