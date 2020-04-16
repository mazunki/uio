import java.util.ArrayList;


public class Rank {
	String src;
	Map map;
	ArrayList<Tile> tiles;
	int length;

	private Rank() {

	}

	public static Rank fromString(String s, Map board) {
		Rank self = new Rank();
		self.src = s;
		self.map = board;

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
		for (char c : this.src.toCharArray()) {
			tiles.add(Tile.fromChar(c));
		}
		return tiles;
	}

	public String toString() {
		//return this.src;
		String leftChar = "|";
		String rightChar = "|";
		String betweenChar = "";

		String out = "";
		for (Tile t : this.tiles) {
			out += t.toString();
		}

		return out;
	}
}