public class Wall extends Tile {
	public Wall() {
		this.defaultChar = "█";
		this.remarkedChar = "#";
	}

	public boolean hasPlayer() {
		return false;
	}

	public String prettyString() {
		if (this.remarked) return this.remarkedChar;
		else return this.defaultChar;
	}
}