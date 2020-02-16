import java.security.AccessControlException;

abstract class Resept {
	protected int id;
	private static int counter=0;
	protected int reit;
	protected int pasientId;
	protected Lege utskrivendeLege;
	protected Legemiddel legemiddel;

	public Resept(Legemiddel legemiddel, Lege utskrivendeLege, int pasientId, int reit) throws AccessControlException {
		this.id = counter;
		counter++;

		this.legemiddel = legemiddel;
		this.utskrivendeLege = utskrivendeLege;
		this.pasientId = pasientId;
		this.reit = reit;

		if (this.legemiddel instanceof Narkotisk) {
			if (!(this.utskrivendeLege instanceof Spesialist)) {
				throw new AccessControlException("This Doctor can't give drugs.");
			}
		}
	}

	public int hentId(){
		return this.id;
	}

	public Legemiddel hentLegemiddel() {
		return this.legemiddel;
	}

	public Lege hentLege() {
		return this.utskrivendeLege;	
	}

	public int hentPasientId() {
		return this.pasientId;
	}

	public int hentReit() {
		return this.reit;
	}

	public boolean bruk() {
		if (this.reit > 0) {
			this.reit--;
			return true;
		} else {
			return false;
		}
	}

	public String farge() {
		if (this instanceof BlaaResept) {
			return "blaa";
		} else if (this instanceof HvitResept) {
			return "hvit";
		} else { 
			return "idk";
		}
	}

	public double prisAaBetale() {
		return this.legemiddel.hentPris();
	}

	public String toString() {
		String stringOut = this.farge() + " resept med " + this.reit + " reits av " + this.legemiddel.hentNavn() + " fra " +
							this.utskrivendeLege.toString() + " til pasient id " + this.pasientId + " koster " + this.prisAaBetale();
		return stringOut;
	}
}