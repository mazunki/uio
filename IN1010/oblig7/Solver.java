import java.util.Scanner;
import java.util.ArrayList;

abstract class Solver {
	Map world;
	protected Solver(Map world) {
		this.world = world;
	}
	protected Solver() {

	}
	public void attachWorld(Map w) {
		this.world = world;
	}

	public void solveFromUserInput() {
		String[] coords;
        do {
        	System.out.println("Found options: ");
        	ArrayList<Opening> valid = this.world.getOpenings();
        	for (Opening t : valid) {
        		System.out.println("\t(" + t.x + "," + t.y + ")");
        	}


	        System.out.println("With coordinates <x> <y>, where do you want to start? Any letter terminates.");

			coords = (new Scanner(System.in)).nextLine().split(" ");
			try {
        		int x = Integer.parseInt(coords[0]);
        		int y = Integer.parseInt(coords[1]);

        		this.setStartTile(this.world.get(y,x));
        		this.solve(); // solving for this tile

			} catch (NumberFormatException e) {
				return;
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("Invalid. Use space to separate indexes.");
				continue;
			}

		} while (coords[0].matches("\\d*") ); // assuming user wants to continue if they wrote one number
	}

	public void solveForAll() {
		for (Tile tile : this.world.getOpenings()) {
			tile.setStart(); // automatically clears map from previous settings
			this.setStartTile(tile);
			this.solve();
		}
	}
	public void solveFor(int j, int i) {
		Tile tile = this.world.get(j, i);
		tile.setStart(); // automatically clears map from previous settings
		this.setStartTile(tile);
		this.solve();
	}
	public void solveForFirst() {
		Tile tile = this.world.findFirstOpening();
		tile.setStart(); // automatically clears map from previous settings
		this.setStartTile(tile);
		this.solve();
	}

	abstract void solve();
	abstract void setStartTile(Tile t);
}