import java.util.Scanner;
import java.util.ArrayList;

abstract class Solver {
	Map world;
	protected Solver(Map world) {
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

        		this.solve(this.world.get(y,x)); // solving for this tile

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
			this.solve(tile);
		}
	}
	public void solveForFirst() {
		Tile tile = this.world.findFirstOpening();
		tile.setStart(); // automatically clears map from previous settings
		this.solve(tile);
		
	}

	abstract void solve(Tile t);
}