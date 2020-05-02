public class Path extends Tile {
	public Path() {
		this.defaultChar = "·";
		this.remarkedChar = "!";
		this.wonderChar = "?";
	}

	public String prettyString() {
		if (this.hasPlayer()) return "p";
		if (this.wondered) return this.wonderChar;
		if (this.remarked) return this.remarkedChar;
		else return this.defaultChar;
	}
}