public class Spesialist extends Lege implements Godkjenningsfritak {
	protected int kontrollID;

	public Spesialist(String navn, int kontrollID) {
		super(navn);
		this.kontrollID = kontrollID;
	}

	public int hentKontrollId(){
		return this.kontrollID;
	}

	@Override
	public String toString() {
		return "Special " + super.toString();
	}
}