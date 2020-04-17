public interface Cartographer {
	public Tile get(int j, int i); // gets a Tile of the map
	public Rank get(int j); // gets a Rank of the map
	public String toString(); // verbose string
	public void print(); // nicely drawn map
}