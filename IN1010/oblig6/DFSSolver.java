import java.util.LinkedList;
import java.util.ArrayList;
import java.util.HashMap;

public class DFSSolver extends Solver {
	boolean solved = false;
	TripleLinkedListNode startTileNode;

	public DFSSolver(Map world) {
		super(world);
	}

	public void solve(Tile startTile) {
		System.out.println("Solving...");

		// We start with defining the root of a Tree-like structure
		this.startTileNode = new TripleLinkedListNode(startTile);
		//System.out.println(this.startTileNode); // long string.

		this.startTileNode.markPaths();
		this.world.print();

		if (this.startTileNode.deadEnd) {
			System.out.println("Unsolvable from this position. =(");
		} else {
			System.out.println("We did it!");
		}
	}
}

class TripleLinkedListNode {
	/*
		This class resembles a LinkedList, but each Node links into 3 other nodes (if possible), instead of one.
	*/
	Tile startTile;
	TripleLinkedListNode previousNode; // previous LinkedListNode
	Tile here; // the "physical" tile
	TripleLinkedListNode pathA; // a new branch of the tree
	TripleLinkedListNode pathB;
	TripleLinkedListNode pathC;
	ArrayList<TripleLinkedListNode> branches; // easier to work on all three paths if we loop over them
	boolean deadEnd; // we don't know if the position of this node is a dead end yet, but we will soon!

	public TripleLinkedListNode(TripleLinkedListNode prev, Tile t) {
		this.previousNode = prev; // obviously
		this.here = t; // obviously

		if (prev == null) this.startTile = this.here;
		else this.startTile = this.previousNode.here;

		branches = new ArrayList<TripleLinkedListNode>(); // arrays are fun

		if (!areWeRunningInCircles(this.here)) // solves cyclic issues
			this.populatePaths(); // ... so now we have a huge trinary tree of paths that a player could walk
		this.checkIfDeadEnd(); // this is the fun part which actually figures out the paths
	}
	public TripleLinkedListNode(Tile t){
		this(null, t);
	}

	public String toString() {
		/* 
			something something we might want to actually see what's going on while debugging
		*/
		String aOut = (pathA == null) ? "" : pathA.toString();
		String bOut = (pathB == null) ? "" : pathB.toString();
		String cOut = (pathC == null) ? "" : pathC.toString();
		return String.format("[%s%s:\t <%s>, <%s>, <%s>]", (deadEnd ? "!" : "o"), this.here, aOut, bOut, cOut);
	}

	public void populatePaths() {
		ArrayList<Tile> tileDirections = this.here.getWalkable(); // returns ortogonal tiles that are paths or openings. handy.

		/*
			so we can have a maximum of three pathways, due to how 2D geometry works (we will come from one)
			we create a new recursed pathway per direction, as long as this exists

			since there is no previous for the first one, we make use of lazy evaluation to avoid a NullPointerException
			we don't really care about the order of the directions the player can walk, so we just check if we have more pathways left.
		*/
		if (tileDirections.size() > 0) this.pathA = (this.previousNode == null || tileDirections.get(0) != this.previousNode.here) ? new TripleLinkedListNode(this, tileDirections.get(0)) : null ;
		if (tileDirections.size() > 1) this.pathB = (this.previousNode == null || tileDirections.get(1) != this.previousNode.here) ? new TripleLinkedListNode(this, tileDirections.get(1)) : null ;
		if (tileDirections.size() > 2) this.pathC = (this.previousNode == null || tileDirections.get(2) != this.previousNode.here) ? new TripleLinkedListNode(this, tileDirections.get(2)) : null ;

		branches.add(pathA); // let's add these to the tree, I guess
		branches.add(pathB); // keep in mind some are actually null, though
		branches.add(pathC);
	}

	public void markPaths() {
		for (TripleLinkedListNode path : branches) {
			if (path != null) path.markPaths(); // recursion, again! I promise this is the last time. this actually paints the road for us =)
		}
		if (!deadEnd) here.remark(); // it's nice to have helper functions, don't you think?
	}

	public void checkIfDeadEnd() {
		/*
			the idea is this: if you're at some point, and you have already checked if the further-down-the-rabbit-hole
			pathways are dead ends, you can confirm you have no other choice than return back to where you came from.

			this works because we're asserting this by searching deeply first. 

			of course, a rabbit-hole is not a dead end if there's a price at the end =)
		*/

		int nBlockedPaths = 0; 
		if (pathA == null || pathA.deadEnd) nBlockedPaths++;
		if (pathB == null || pathB.deadEnd) nBlockedPaths++;
		if (pathC == null || pathC.deadEnd) nBlockedPaths++;

		if (!(this.here instanceof Opening) && nBlockedPaths == 3) deadEnd = true; // we've reached a dead end
		else {
			if (this.here == this.startTile && nBlockedPaths == 3) {
				deadEnd = true;
			} else {
				deadEnd = false;
			}
		}
	}

	public boolean areWeRunningInCircles(Tile weAreHereNow) {
		Tile checkForTile;
		while (this.previousNode != null) {
			checkForTile = this.previousNode.here;

			if (checkForTile == weAreHereNow){
				return true;
			} else {
				return this.previousNode.areWeRunningInCircles(weAreHereNow); // this messes with maps/4.in's results for some reason, i don't understand why
			}
		}
		return false;
	}
}