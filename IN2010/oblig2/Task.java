import java.util.List; 
import java.util.ArrayList; 

class Task {
	int id;
	int time, manpower;
	int earliestStart, latestStart;
	List<Task> edgesOut = new ArrayList<Task>();
	List<Task> edgesIn = new ArrayList<Task>();
	int numPredecessors;
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
		return "in: {" + this.edgesIn.toString() + "}, \nout: {" + this.edgesOut.toString() + "}";
	}
}