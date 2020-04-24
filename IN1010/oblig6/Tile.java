import java.util.ArrayList;

abstract class Tile extends Pixel {
	boolean isStart = false;
	boolean remarked;
	boolean wondered;
	String defaultChar; // subclasses assign these
	String remarkedChar;
	String wonderChar;

	int indexOnRank;
	Rank parentRank;
	int x, y;
	ArrayList<Tile> neighbours;
	ArrayList<Tile> allNeighbours;

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

	public ArrayList<Tile> getAllNeighbours() { // includes diagonals
		if (this.allNeighbours != null) return this.allNeighbours; // premature optimization yay
		
		this.allNeighbours = new ArrayList<Tile>();
		for (int j=-1; j<=1; j++) { // starting N, then same, then S
			for (int i=-1; i<=1; i++){ // starting W, then same, then E
				if (i==0 && j==0) continue; // self
				else if (x + i < 0) continue; // over N boundary
				else if (x + i > (this.parentRank.map.mapHeight-1)) continue; // under S boundary
				else if (y + j < 0) continue; // left to W boundary
				else if (y + j > (this.parentRank.map.mapWidth-1)) continue; // right to E boundary
				else { 
					//System.out.println(String.format("At (%d, %d)+(%d, %d)", y,x,j,i));
					this.allNeighbours.add(parentRank.map.get(y+j,x+i));
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

	public Tile walkFrom(Tile from) {
		if (from == null) return this.walkFrom();
		assert this.getWalkable().size() == 2;

		for (Tile t : this.getWalkable()){
			if (t != from) return t;
		}
		return null;
	}
	public Tile walkFrom() {
		assert this.getWalkable().size() == 1;
		return this.getWalkable().get(0);
	}

	public void remark() {
		this.remarked = true;
	}
	public void noRemark() {
		this.remarked = false;
	}
	public void wonder() {
		this.wondered = true;
	}
	public void noWonder() {
		this.wondered = false;
	}
	

	public void setStart() {
		this.parentRank.map.clearCache();
		this.isStart = true;
	}

	public void unsetStart() {
		this.isStart = false;
	}

	public String toString() {
		return String.format("(%d,%d,%s)", this.parentRank.indexOnBoard, this.indexOnRank, this.prettyString());//, this.hasPlayer());
	}
	abstract String prettyString();

	public boolean hasPlayer() {
		return false; // subclasses can override this, default tiles can't have players
	}
}