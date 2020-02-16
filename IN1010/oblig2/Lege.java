public class Lege {
	protected String navn;

	public Lege(String navn){
		this.navn = navn;
	}

	public String hentNavn() {
		return this.navn;
	}

	public String toString() {
		return "Dr. " + this.hentNavn();
	}
}