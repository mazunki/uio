import java.util.ArrayList;


public class Rank {
	String src;
	Map map;
	ArrayList<Tile> tiles;
	int length;
	int indexOnBoard;

	private Rank() {

	}

	public static Rank fromString(String s, Map board, int j) {
		Rank self = new Rank();
		self.src = s;
		self.map = board;
		self.indexOnBoard = j;
		self.length = self.map.mapWidth;

		try {
			self.parse();
		} catch (Exception e) {
			System.out.println(e.getCause());
			System.out.println("Something went wrong, but the Rank was created unsuccesfully.");
		}


		return self;
	}

	private ArrayList<Tile> parse() throws Exception {
		tiles = new ArrayList<Tile>(map.mapWidth);
		for (int i=0; i<this.src.length(); i++) {

			char c = this.src.toCharArray()[i];
			tiles.add(Tile.fromChar(c, i, this));
		}
		return tiles;
	}

	public String toString() {
		String out = "";
		for (Tile t : this.tiles) {
			out += t.toString();
		}

		return out;
	}
	public String prettyString() {
		String leftChar = "|";
		String rightChar = "|";
		String betweenChar = "";

		String out = "";
		for (Tile t : this.tiles) {
			out += t.prettyString();
		}

		return out;
	}

	public Tile get(int index) {
		return tiles.get(index);
	}
}