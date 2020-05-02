import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.File;
import java.util.Scanner;

import java.util.ArrayList;

public class Map implements Cartographer {
	private String sourceFilename;
	private ArrayList<String> sourceRanks; // aka rows, gameboard terminology
	private ArrayList<Rank> tiledRanks; // sourceMap[j][i];

	private ArrayList<Opening> allOpenings;

	int mapWidth, mapHeight;

	public Map() throws Error, FileNotFoundException {
		this.readFromFile();
		this.updateOpenings();
	}
	public Map(String filename) throws Error, FileNotFoundException {
		this.readFromFile(filename);
		this.updateOpenings();
	}
	public Map(File file) throws Error, FileNotFoundException {
		this.readFromFile(file);
		this.updateOpenings();
	}

	private void readFromFile() throws Error, FileNotFoundException {
		sourceFilename = Console.getString("What is your filename?");
		readFromFile(sourceFilename);
	}

	private void readFromFile(File file) throws Error, FileNotFoundException {
		//sourceFilename = filename;
		if (file == null) throw new FileNotFoundException();
		sourceFilename = file.getName();
		Scanner in = new Scanner(file);
		readFromFileParser(in);
	}

	private void readFromFile(String filename) throws Error, FileNotFoundException {
		Scanner in = new Scanner(new FileReader(filename));
		readFromFileParser(in);
	} 

	private void readFromFileParser(Scanner in) {
		/* 
			We're assuming the first line in a file has a `M N` format, telling its X * Y size.
			Lines 2 until EOF are part of the map board, and should correspond with the given size.
		*/

		// getting board size
		if (in.hasNext()) {
			this.mapHeight = in.nextInt();
			this.mapWidth = in.nextInt();
		} else {
			throw new Error("Provided file is empty.");
		}

		// each sourceRanks element is a String containing the whole rank
		this.sourceRanks = new ArrayList<String>(this.mapHeight);
		while (in.hasNextLine()) {
			String line = in.nextLine();
			if (!line.equals("")) { // asserting the line actually contains something
				//System.out.println("> " + line);
				sourceRanks.add(line);
			}
		}

		this.tiledRanks = new ArrayList<Rank>(this.mapHeight);
		for (int j=0; j<sourceRanks.size(); j++) {
			Rank r = Rank.fromString(sourceRanks.get(j), this, j);
			// System.out.println(r);
			tiledRanks.add(r);
		}

	}

	public String toString() {
		//System.out.println(sourceRanks);
		String out = "";
		for (Rank r : this.tiledRanks){
			out += r.toString() + "\n";
		}
		return out;
	}

	public void print() {
		String out = "";
		for (Rank r : this.tiledRanks){
			out += r.prettyString() + "\n";
		}
		System.out.println(out);
	}

	public Tile get(int j, int i) {
		if (j<0 || i<0) return null;
		if (i>=this.mapWidth || j>=this.mapHeight) return null;
		return this.tiledRanks.get(j).get(i);
	}
	public Rank get(int j) {
		return this.tiledRanks.get(j);
	}

	public int getHeight() {
		return this.mapHeight;
	}
	public int getWidth() {
		return this.mapWidth;
	}

	public Opening findFirstOpening() {
		return this.allOpenings.get(0);
	}
	public Opening findOpening(int n) {
		return this.allOpenings.get(n);
	}

	public ArrayList<Opening> getOpenings() {
		return this.allOpenings;
	}

	public void updateOpenings() {
		this.allOpenings = new ArrayList<Opening>();
		for (Rank r : this.tiledRanks) {
			for (Tile t : r.tiles) {
				if (t instanceof Opening) {
					this.allOpenings.add((Opening)t);
				}
			}
		}
	}

	public void clearCache() {
		for (Rank r : this.tiledRanks) {
			for (Tile t : r.tiles) {
				t.unsetStart();
				t.noRemark();
				t.noWonder();
			}
		}
	}

	public void log() {
		System.out.println(String.format("Found a map of size %d wide x %d tall", this.mapWidth, this.mapHeight));
	}
}