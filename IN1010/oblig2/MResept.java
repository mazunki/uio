public class MResept extends HvitResept {
	public MResept(Legemiddel legemiddel, Lege utskrivendeLege, int pasientId, int reit) {
		super(legemiddel, utskrivendeLege, pasientId, reit);
	}

	@Override
	public double prisAaBetale() {
		double discount = 1.00;
		return (1-discount)*this.legemiddel.hentPris();
	}
}