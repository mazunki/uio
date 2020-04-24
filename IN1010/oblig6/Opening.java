public class Opening extends Path {
	public Opening() {
		this.defaultChar = "░";
		this.remarkedChar = "o";
	}

	public boolean hasPlayer() {
		return super.hasPlayer();
	}

	public String prettyString() {
		if (this.hasPlayer()) return "p";
		if (this.isStart) return "s";
		if (this.remarked) return this.remarkedChar;
		else return this.defaultChar;
	}
}