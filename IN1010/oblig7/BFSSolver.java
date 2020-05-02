import java.util.ArrayList;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;


public class BFSSolver extends Solver implements Runnable {
	//Network net;
	volatile ArrayList<Tile> alreadyHandledTiles;
	ArrayList<LinkedList<Tile>> winnerPaths;
	boolean printToScreen = false;
	boolean done = false;
	Tile startTile;

	public BFSSolver(Map world) {
		super(world);
	}
	public BFSSolver() {
		//super(world);
	}
	public void attachWorld(Map w) {
		// clearing old variable names if we want to reuse
		this.alreadyHandledTiles = null;
		this.winnerPaths = null;
		this.world = w;
	}

	public ArrayList<LinkedList<Tile>> getWinnerPaths() {
		return this.winnerPaths;
	}

	public void setStartTile(Tile startTile) {
		this.startTile = startTile;
	}

	public void run() {		
		this.solve();
	}

	public void solve() {
		this.alreadyHandledTiles = new ArrayList<Tile>();
		this.winnerPaths = new ArrayList<LinkedList<Tile>>();
		Walker w = new Walker(this, this.startTile);
		w.run();

		if (printToScreen) System.out.println("\n\n\nSimulation complete. Printing results. ");

		//this.world.print(); // prints walked path
		for (LinkedList<Tile> wPath : winnerPaths) {
			this.world.clearCache();

			//if (printToScreen)
			 System.out.println("Found winner: " + wPath);
			if (printToScreen) System.out.println();

			for (Tile t : wPath) {
				t.remark();
			}
			if (printToScreen) this.world.print();
		}

		this.done = true;
	}

	public boolean isDone() {
		return this.done;
	}

	public class Walker implements Runnable {
		Tile now;
		Tile prev;
		BFSSolver solver;
		Thread thr;
		ArrayList<Thread> subthreads;
		LinkedList<Tile> path;

		int delay = 50;

		public Walker(BFSSolver s, Tile t) {
			this.solver = s;

			this.now = t;
			this.prev = null;
			this.path = new LinkedList<Tile>();
			this.path.addFirst(t);
		}
		public Walker(BFSSolver s, Tile t, Tile p, LinkedList<Tile> path) {
			this.solver = s;

			this.now = t;
			this.prev = p;

			this.path = new LinkedList<Tile>(path);
			this.path.offer(this.now);
			this.solver.alreadyHandledTiles.add(this.now);
		}

		public void run(){
			if (printToScreen) System.out.println("Starting to walk at " + this.now + " while coming from " + this.prev);
			// walk until a junction
			while (this.now.getWalkable().size() == 2 && ((this.now instanceof Opening) || this.path.get(0) instanceof Opening)
									|| this.now.getWalkable().size() == 1 && this.prev == null) {
				//System.out.println("walking");
				this.solver.alreadyHandledTiles.add(this.now);
				this.now.remark();
				//if (printToScreen) System.out.println(this.now.getWalkable());
				Tile aux = this.now;
				this.now = aux.walkFrom(this.prev);
				this.prev = aux;
				
				this.path.offer(this.now);
				if (printToScreen) this.solver.world.print();

				try { TimeUnit.MILLISECONDS.sleep(this.delay); }
				catch (InterruptedException e) {}
				
			}
			//if (printToScreen) System.out.println("Arrived to " + this.now + " while coming from " + this.prev);

			if (this.now.getWalkable().size() > 1) {
				this.now.wonder();
				this.subthreads = new ArrayList<Thread>();

				for (Tile t : this.now.getWalkable()) {
					if (t instanceof Opening) {
						if (printToScreen) System.out.println("Winner!");
						t.remark();
						if (printToScreen) this.solver.world.print();
						if (printToScreen) System.out.println("Winner path: " + this.path);

						this.path.offer(t);
						this.solver.winnerPaths.add(this.path);

					} else {
						if (!this.solver.alreadyHandledTiles.contains(t)) {
							//if (printToScreen) System.out.println("NEW THREAD AT " + t + " from " + this.prev);
							thr = new Thread( (new Walker(this.solver, t, this.now, this.path)) ) ;
							subthreads.add(thr);
							//if (printToScreen) this.solver.world.print();
						}
					}
				}
				this.solver.alreadyHandledTiles.add(this.now);
				for (Thread subt : this.subthreads) {
					subt.start();
				}
				for (Thread subt : this.subthreads) {
					try {
						subt.join();

					} catch (InterruptedException e) {

					}
				}


				//this.now.remark();
			} else {
				this.now.remark();
				if (this.now instanceof Opening) {
					if (printToScreen) System.out.println("Winner!");
					if (printToScreen) this.solver.world.print();
					if (printToScreen) System.out.println("Winner path: " + this.path);

					this.path.offer(this.now);
					this.solver.winnerPaths.add(this.path);
				}
			}


			//if (printToScreen) System.out.println(this.solver.alreadyHandledTiles);
			if (printToScreen) this.solver.world.print();
			//if (printToScreen) System.out.println(this.solver.world);
		}
	}
}