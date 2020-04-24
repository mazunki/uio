import java.util.ArrayList;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;

public class BFSSolver extends Solver {
	//Network net;
	ArrayList<Tile> alreadyHandledTiles;
	ArrayList<LinkedList<Tile>> winnerPaths;

	public BFSSolver(Map world) {
		super(world);
	}

	public void solve(Tile startTile) {		
		this.alreadyHandledTiles = new ArrayList<Tile>();
		this.winnerPaths = new ArrayList<LinkedList<Tile>>();
		Walker w = new Walker(this, startTile);
		w.run();

		System.out.println("\n\n\nSimulation complete. Printing results. ");

		this.world.print();
		for (LinkedList<Tile> wPath : winnerPaths) {
			this.world.clearCache();

			System.out.println("Found winner: " + wPath);
			System.out.println();

			for (Tile t : wPath) {
				t.remark();
			}
			this.world.print();
		}
	}

	public class Walker implements Runnable {
		Tile now;
		Tile prev;
		BFSSolver solver;
		Thread thr;
		ArrayList<Thread> subthreads;
		LinkedList<Tile> path;

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
			System.out.println("Starting to walk at " + this.now + " while coming from " + this.prev);
			// walk until a junction
			while (this.now.getWalkable().size() == 2 || this.now.getWalkable().size() == 1 && this.prev == null) {
				this.solver.alreadyHandledTiles.add(this.now);
				this.now.remark();
				//System.out.println(this.now.getWalkable());
				Tile aux = this.now;
				this.now = aux.walkFrom(this.prev);
				this.prev = aux;
				
				this.path.offer(this.now);
				this.solver.world.print();

				try { TimeUnit.MILLISECONDS.sleep(300); }
				catch (InterruptedException e) {}
				
			}
			//System.out.println("Arrived to " + this.now + " while coming from " + this.prev);

			if (this.now.getWalkable().size() > 1) {
				this.now.wonder();
				this.subthreads = new ArrayList<Thread>();

				for (Tile t : this.now.getWalkable()) {
					if (t instanceof Opening) {
						System.out.println("Winner!");
						t.remark();
						this.solver.world.print();
						System.out.println("Winner path: " + this.path);

						this.path.offer(t);
						this.solver.winnerPaths.add(this.path);

					} else {
						if (!this.solver.alreadyHandledTiles.contains(t)) {
							//System.out.println("NEW THREAD AT " + t + " from " + this.prev);
							thr = new Thread( (new Walker(this.solver, t, this.now, this.path)) ) ;
							subthreads.add(thr);
							//this.solver.world.print();
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
					System.out.println("Winner!");
					this.solver.world.print();
					System.out.println("Winner path: " + this.path);

					this.path.offer(this.now);
					this.solver.winnerPaths.add(this.path);
				}
			}


			//System.out.println(this.solver.alreadyHandledTiles);
			this.solver.world.print();
			//System.out.println(this.solver.world);
		}
	}
}