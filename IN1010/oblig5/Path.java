public class Path extends Tile {
	public Path() {
		this.outputChar = "·";
	}

	@Override
	public boolean hasPlayer() {
		Player p = this.parentRank.map.labyrinth.player;
		if (p.i == this.x && p.j == this.y) {
			return true;
		} else {
			return false;
		}
	}
}