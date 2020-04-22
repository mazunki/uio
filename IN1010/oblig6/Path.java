public class Path extends Tile {
	public Path() {
		this.defaultChar = "·";
		this.remarkedChar = "!";
	}

	public String prettyString() {
		if (this.hasPlayer()) return "p";
		if (this.remarked) return this.remarkedChar;
		else return this.defaultChar;
	}
}