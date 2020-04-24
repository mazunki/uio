import java.util.ArrayList;

public class Network {
	Map world;
	ArrayList<Link> links;

	public Network(Map w) {
		this.world = w;
		links = new ArrayList<Link>();
		this.generateNetwork();
	}

	public Network generateNetwork() {
		for (int i=0; i<this.world.getWidth(); i++) {
			for (int j=0; j<this.world.getHeight(); j++) {
				Tile here = this.world.get(j,i);
				if (here.getWalkable().size()==2) continue;

				Tile eastwards = findJunction(here, Direction.EAST);
				if ((here instanceof Path) && (eastwards instanceof Path)) {
					links.add(new Link(here, eastwards));
				}

				Tile southwards = findJunction(this.world.get(j,i), Direction.SOUTH);
				if ((here instanceof Path) && (southwards instanceof Path)) {
					links.add(new Link(here, southwards));
				}
			}
		}
		for (Link l : this.links) {
			System.out.println(l);
			l.remarkBoth();
		}
		return null;
	}

	public Tile findJunction(Tile t, Direction orientation) {
		int jStep = orientation.j;
		int iStep = orientation.i;
		//System.out.println(t);

		Tile currentTile = this.world.get(t.y + jStep, t.x + iStep);
		ArrayList<Tile> nextTiles = currentTile.getWalkable();
		if (nextTiles.size() == 2) {
			for (Tile n : nextTiles) {
				if (n != t) return n;
			}
		}
		return t;
	}

	class Link {
		Tile start;
		Tile end;
		
		public Link(Tile a, Tile b) {
			this.start = a;
			this.end = b;
		}
		public String toString() {
			return "<" + this.start + "—" + this.end + ">";
		}
		public void remarkBoth() {
			this.start.remark();
			this.end.remark();
		}
	}

	public enum Direction {
		NORTH(-1,0), SOUTH(+1,0), WEST(0,-1), EAST(0,+1);
		int j;
		int i;
		Direction(int j, int i) {
			this.j = j;
			this.i = i;
		}
	}
}