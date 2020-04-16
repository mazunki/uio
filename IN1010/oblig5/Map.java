import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

import java.util.ArrayList;

public class Map implements Cartographer {
	private String sourceFilename;
	private ArrayList<String> sourceRanks; // aka rows, gameboard terminology
	private ArrayList<Rank> tiledRanks; // sourceMap[j][i];

	int mapWidth, mapHeight;

	public Map() {
		try {
			this.readFromFile();
		} catch (FileNotFoundException e) {
			System.out.println("Couldn't find that file. =(");
		} catch (Error e) {
			System.out.println(e);
		}
	}
	public Map(String filename) {
		try { 
			this.readFromFile(filename);
		} catch (FileNotFoundException e) {
			System.out.println("Couldn't find that file. =(");
		} catch (Error e) {
			System.out.println(e);
		}
	}
	public static void main(String[] args) {
		Map testMap = (args.length == 0) ? new Map() : new Map(args[0]);
		
		//System.out.println(testMap.sourceFilename);
		//System.out.println(testMap.tiledRanks);
		System.out.println(testMap.get(5,4));
		System.out.println();
		testMap.get(7,4).remark();
		System.out.println(testMap);
		for (Tile t : testMap.get(7,4).getNeighbours()) {
			t.scream();
		}
		System.out.println(testMap);
	}

	private boolean readFromFile() throws Error, FileNotFoundException {
		sourceFilename = Console.getString("What is your filename?");
		return this.readFromFile(sourceFilename);
	}

	private boolean readFromFile(String filename) throws Error, FileNotFoundException {
		/* 
			We're assuming the first line in a file has a `M N` format, telling its X * Y size.
			Lines 2 until EOF are part of the map board, and should correspond with the given size.
		*/
		sourceFilename = filename;
		Scanner in = new Scanner(new FileReader(filename));

		// getting board size
		if (in.hasNext()) {
			this.mapWidth = in.nextInt();
			this.mapHeight = in.nextInt();
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

		return true;
	}

	public String toString() {
		//System.out.println(sourceRanks);
		String out = "";
		for (Rank r : this.tiledRanks){
			out += r.toString() + "\n";
		}
		return out;
	}

	public Tile get(int j, int i) {
		return this.tiledRanks.get(j).get(i);
	}
}