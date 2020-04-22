import java.io.FileNotFoundException;
import java.util.Scanner;

public class Labyrinth {
	Map board;
	DFSSolver solver; // depth-first solver

	public Labyrinth() throws FileNotFoundException, Error{
		this.board = new Map(this);
		//this.player = new Player(this.board); // useful if we want to create a game or something
		this.solver = new DFSSolver(this.board);
	}
	public Labyrinth(String filename) throws FileNotFoundException, Error {
		this.board = new Map(filename, this);
		this.solver = new DFSSolver(this.board);
	}

	public static void main(String[] args) {
		try {
			Labyrinth labyrinth = (args.length == 0) ? new Labyrinth() : new Labyrinth(args[0]);
			labyrinth.start();
		} catch (FileNotFoundException e) {
			System.out.println("Couldn't find that file. =(");
		} catch (Error e) {
			System.out.println(e);
		}
	}

	public void start() {
		this.board.log(); // prints some info of creation
		this.board.print(); // show clean board
		
		// to solve, we must have some point to solve from. we are potentially loosing some pathways if a labyrinth is actually completely split in too.
		// to solve this, we could simply run a for-loop on all the openings, but usually you can't be in two places at the same time, so this makes little sense.
		
		//this.solver.solve(this.board.findFirstOpening());


		// in order to allow for user input
		System.out.println("With coordinates <x> <y>, where do you want to start? Any letter terminates.");
		String[] coords = (new Scanner(System.in)).nextLine().split(" ");
        while (coords[0].matches("\\d") && coords[1].matches("\\d")) {
        	int x = Integer.parseInt(coords[0]);
        	int y = Integer.parseInt(coords[1]);

        	this.solver.solve(this.board.get(y,x));
			

			System.out.println("With coordinates <x> <y>, where do you want to start? Any letter terminates.");
			coords = (new Scanner(System.in)).nextLine().split(" ");
        }
	}
}