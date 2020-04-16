public class Labyrinth {
	public static void main(String[] args) {
		Map board = (args.length == 0) ? new Map() : new Map(args[0]);
		Player mazunki = new Player();
		Solver solver = new DFSSolver();
	}
}