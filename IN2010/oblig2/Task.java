import java.util.List; 
import java.util.ArrayList; 

class Task {
	int id;
	int time, manpower;
	int earliestStart, latestStart, allowedSleep;
	List<Task> edgesOut = new ArrayList<Task>();
	List<Task> edgesIn = new ArrayList<Task>();
	String name;

	public Task(int id, int time, int manpower, String name) {
		this.id = id;
		this.time = time;
		this.manpower = manpower;
		this.name = name;
	}

	public boolean isCyclic() {
		return this.isCyclic(new ArrayList<Task>());
	}

	public boolean isCyclic(List<Task> visited) {
		// takes at most O(n), bounded by the number of nodes+links, since we will at most check each node once
		for (Task pre : this.getInwards()) {
			if (visited.contains(pre)) {
				return true;
			} else {
				List<Task> _visited = new ArrayList<Task>(visited);
				_visited.add(this);
				if (pre.isCyclic(_visited)) {
					return true;
				}
			}
		}
		//System.out.println(this.toString() + ": " + this.info() + "\n" + visited);
		return false;
	}

	public int getEarliestStart() {
		if (this.getInwards().size() == 0) {
			return 0;
		}
		
		int min = 0;
		for (Task n : this.getInwards()) {
			int dist = n.getEarliestStart() + n.time;
			if (dist > min) {
				min = dist;
			}
		}
		return min;
	}
	public int getFastestPossible() {
		return this.getEarliestStart() + this.time;
	}

	public int getAllowedProcrastination() {
		if (this.getOutwards().size() == 0) {
			return 0;
		}
		int max = Integer.MAX_VALUE;
		for (Task post : this.getOutwards()) {
			int dist = post.getEarliestStart() - this.getFastestPossible();
			if (dist < max) {
				max = dist;
			}
		}
		return max;
	}

	public List<Task> getInwards() {
		return this.edgesIn;
	}
	public List<Task> getOutwards() {
		return this.edgesOut;
	}

	public void addEdgeIn(Task task) {
		edgesIn.add(task);
	}
	public void addEdgeOut(Task task) {
		edgesOut.add(task);
	}

	public String toString() {
		return this.name + "(" + this.id + "): {T:" + this.time + ", M:" + this.manpower + "}";
	}

	public String info() {
		return "IN: {" + this.edgesIn.toString() + "}, \tOUT: {" + this.edgesOut.toString() + "}";
	}

	public void timings() {
		System.out.println(this);
		System.out.println(this.info());
		System.out.println("Can't start before: " + this.getEarliestStart());
		System.out.println("I can sleep for " + this.getAllowedProcrastination());
		System.out.println();
	}
	public void calculateTimings() {
		this.earliestStart = this.getEarliestStart();
		this.allowedSleep = this.getAllowedProcrastination();
		this.latestStart = this.earliestStart + this.allowedSleep;
	}
}