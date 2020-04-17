import java.util.LinkedList;
import java.util.ArrayList;
import java.util.HashMap;

public class DFSSolver extends Solver {
	boolean solved = false;
	int steps = 0;
	HashMap<Tile, Integer> tilePathsMap;
	Player p;
	Map world;

	public DFSSolver(Player player) {
		tilePathsMap = new HashMap<Tile, Integer>();
		
		this.p = player;
		world = this.p.world;
	}

	public void solve() {
		System.out.println("Solving...");

		System.out.println(this.findPath(p.getTile()));
	}

	public ArrayList<Tile> findPath(Tile lastTile) {
		world.print();

		//Tile t = world.get(j,i);
		if (lastTile instanceof Opening) return true;
		if (lastTile.getWalkable(lastTile).size() == 0) return false;
		lastTile.remark();
		for (Tile t : lastTile.getForwards(lastTile)) {
			if (findPath())
		}

		return paths;
	}
}