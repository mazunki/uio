public class Wall extends Tile {
	public Wall() {
		this.outputChar = "█";
	}

	public boolean hasPlayer() {
		return false;
	}
}