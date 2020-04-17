import java.util.ArrayList;

public class Player {
	int i, j;
	DFSSolver solver;
	Map world;

	public Player(Map world) {
		this.world = world;
		solver = new DFSSolver(this);
	}

	public void move(int j, int i) {
		this.j = j;
		this.i = i;
	}
	public void move(Tile t) {
		this.j = t.y;
		this.i = t.x;
	}

	public Tile getTile() {
		return world.get(this.j, this.i);
	}

	public ArrayList<Tile> getPotentialPaths() {
		ArrayList<Tile> paths = new ArrayList<Tile>();
		for (Tile t : this.getTile().getOrtoNeighbours()) {
			if (t instanceof Path || t instanceof Opening) {
				paths.add(t);
			}
		}
		return paths;
	}

	public String toString() {
		return String.format("(%d, %d)", this.j, this.i);
	}
}