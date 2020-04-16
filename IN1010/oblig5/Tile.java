import java.util.ArrayList;

public class Tile extends Pixel {
	String outputChar;
	int indexOnRank;
	Rank parentRank;
	int x, y;
	ArrayList<Tile> neighbours;

	protected Tile() {

	}

	public static Tile fromChar(char c, int i, Rank r) throws Exception {
		Tile t;
		if (c == '.') {
			if (i == 0 || i == r.map.mapWidth || r.indexOnBoard == 0 || r.indexOnBoard == r.map.mapHeight) {
				t = new Opening();
			} else {
				t = new Path();
			}

		} else if (c == '#') {
			t = new Wall();
		} else {
			throw new Exception("Corrupted file.");
		}

		t.indexOnRank = i;
		t.parentRank = r;
		t.x = i;
		t.y = t.parentRank.indexOnBoard;
		return t;
	}

	public String toString() {
		//return String.format("(%d,%d,%s)", this.parentRank.indexOnBoard, this.indexOnRank, this.outputChar);
		return this.outputChar;
	}

	public ArrayList<Tile> getNeighbours() {
		if (neighbours != null) return neighbours; // premature optimization yay
		
		neighbours = new ArrayList<Tile>();
		for (int j=-1; j<=1; j++) { // starting N, then same, then S
			for (int i=-1; i<=1; i++){ // starting W, then same, then E
				if (i==0 && j==0) continue; // self
				else if (x + i < 0) continue; // over N boundary
				else if (x + i > (this.parentRank.map.mapHeight-1)) continue; // under S boundary
				else if (y + j < 0) continue; // left to W boundary
				else if (y + j > (this.parentRank.map.mapWidth-1)) continue; // right to E boundary
				else { 
					//System.out.println(String.format("At (%d, %d)+(%d, %d)", y,x,j,i));
					neighbours.add(parentRank.map.get(y+j,x+i));
				}
			}
		}
		return neighbours;
	}

	public void scream() {
		this.outputChar = "!";
	}
	public void remark() {
		this.outputChar = "?";
	}
}