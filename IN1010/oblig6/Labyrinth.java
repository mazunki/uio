import java.io.FileNotFoundException;
import java.util.Scanner;

public class Labyrinth {
	Map board;
	BFSSolver solver; // depth-first solver

	public Labyrinth() throws FileNotFoundException, Error{
		this.board = new Map(this);
		//this.player = new Player(this.board); // useful if we want to create a game or something
		this.solver = new BFSSolver(this.board);
	}
	public Labyrinth(String filename) throws FileNotFoundException, Error {
		this.board = new Map(filename, this);
		this.solver = new BFSSolver(this.board);
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
		
		//this.solver.solveFromUserInput();  // user interface
		//this.solver.solveForAll(); // for all openings...
		this.solver.solveForFirst();
	}
}