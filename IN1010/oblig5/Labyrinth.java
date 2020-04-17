public class Labyrinth {
	Map board;
	Player player;

	public Labyrinth() {
		this.board = new Map(this);
		this.player = new Player(this.board);
	}
	public Labyrinth(String filename) {
		this.board = new Map(filename, this);
		this.player = new Player(this.board);
	}

	public static void main(String[] args) {
		Labyrinth labyrinth = (args.length == 0) ? new Labyrinth() : new Labyrinth(args[0]);
		labyrinth.start();
	}

	public void start() {
		this.board.log();

		this.board.print(); // show clean board
		this.player.move(this.board.findFirstOpening()); // players joins the game!
		this.board.print(); // let's actually see the player too
		this.player.getPotentialPaths(); // and figure out the first thing the player can do
		
		this.player.solver.solve();
	}
}