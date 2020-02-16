public class BlaaResept extends Resept {
	public BlaaResept(Legemiddel legemiddel, Lege utskrivendeLege, int pasientId, int reit){
		super(legemiddel, utskrivendeLege, pasientId, reit);
	}

	@Override
	public double prisAaBetale() {
		double discount = 0.75;
		return (1-discount)*this.legemiddel.hentPris();
	}
}
