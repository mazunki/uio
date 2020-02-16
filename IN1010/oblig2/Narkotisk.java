
public class Narkotisk extends Legemiddel {
	protected int styrke;

	public Narkotisk(String navn, double pris, double virkestoff, int styrke) {
		super(navn, pris, virkestoff);
		this.styrke = styrke;
	}

	public int hentNarkotiskStyrke() {
		return this.styrke;
	}

	@Override
	public String toString() {
		String oldString = super.toString();
		return oldString + " with intensity " + this.styrke;
	}
}