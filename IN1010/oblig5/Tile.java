

public class Tile extends Pixel {
	String outputChar;
	
	protected Tile() {

	}

	public static Tile fromChar(char c) throws Exception {
		if (c == '.') {
			return new Path();
		} else if (c == '#') {
			return new Wall();
		}
		throw new Exception("Corrupted file.");
	}

	public String toString() {
		return this.outputChar;
	}
}