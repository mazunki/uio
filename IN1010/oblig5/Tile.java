import java.util.ArrayList;

public class Tile extends Pixel {
	String outputChar;
	String tempChar;
	int indexOnRank;
	Rank parentRank;
	int x, y;
	ArrayList<Tile> neighbours;

	protected Tile() {

	}

	public static Tile fromChar(char c, int i, Rank r) throws Exception {
		Tile t;
		if (c == '.') {
			if (i == 0 || i == r.map.mapWidth-1 || r.indexOnBoard == 0 || r.indexOnBoard == r.map.mapHeight-1) {
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

	public ArrayList<Tile> getAllNeighbours() {
		if (this.neighbours != null) return this.neighbours; // premature optimization yay
		
		this.neighbours = new ArrayList<Tile>();
		for (int j=-1; j<=1; j++) { // starting N, then same, then S
			for (int i=-1; i<=1; i++){ // starting W, then same, then E
				if (i==0 && j==0) continue; // self
				else if (x + i < 0) continue; // over N boundary
				else if (x + i > (this.parentRank.map.mapHeight-1)) continue; // under S boundary
				else if (y + j < 0) continue; // left to W boundary
				else if (y + j > (this.parentRank.map.mapWidth-1)) continue; // right to E boundary
				else { 
					//System.out.println(String.format("At (%d, %d)+(%d, %d)", y,x,j,i));
					this.neighbours.add(parentRank.map.get(y+j,x+i));
				}
			}
		}
		return this.neighbours;
	}
	public ArrayList<Tile> getOrtoNeighbours() {
		if (this.neighbours != null) return this.neighbours; // premature optimization yay
		
		this.neighbours = new ArrayList<Tile>();
		for (int j=-1; j<=1; j++) { // starting N, then same, then S
			for (int i=-1; i<=1; i++){ // starting W, then same, then E
				if (i==0 && j==0) continue; // self
				else if (x + i < 0) continue; // over N boundary
				else if (x + i > (this.parentRank.map.mapWidth-1)) continue; // under S boundary
				else if (y + j < 0) continue; // left to W boundary
				else if (y + j > (this.parentRank.map.mapHeight-1)) continue; // right to E boundary
				else if (j*i != 0) continue; // diagonals
				else { 
					//System.out.println(String.format("At (%d, %d)+(%d, %d)", y,x,j,i));
					this.neighbours.add(parentRank.map.get(y+j,x+i));
				}
			}
		}
		return this.neighbours;
	}

	public ArrayList<Tile> getWalkable() {
		ArrayList<Tile> walks = new ArrayList<Tile>();
		for (Tile t : this.getOrtoNeighbours()){
			if (t instanceof Path) walks.add(t);
		}
		return walks;
	}

	public void scream() {
		this.tempChar = "!";
	}
	public void remark() {
		this.tempChar = "░";
	}
	public void clearTempChar() {
		this.tempChar = this.outputChar;
	}

	public String toString() {
		return String.format("(%d,%d,%s,%b)", this.parentRank.indexOnBoard, this.indexOnRank, this.outputChar, this.hasPlayer());
	}
	public String prettyString() {
		if (this.tempChar == null) this.clearTempChar();
		return (this.hasPlayer()) ? "p" : this.tempChar;
	}

	public boolean hasPlayer() {
		return false; // subclasses can override this, default tiles can't have players
	}
}