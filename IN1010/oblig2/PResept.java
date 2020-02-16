public class PResept extends HvitResept {
	private static int reit = 3;
	public PResept(Legemiddel legemiddel, Lege utskrivendeLege, int pasientId) {
		super(legemiddel, utskrivendeLege, pasientId, reit);
	}

	@Override
	public double prisAaBetale() {
		double flatDiscount = 108.00;
		double newPrice = this.legemiddel.hentPris() - flatDiscount;
		if (newPrice < 0.0) {
			return 0.00;
		} else {
			return newPrice;
		}
	}
}