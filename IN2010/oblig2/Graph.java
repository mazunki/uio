import java.util.List;
import java.util.ArrayList;

class Graph {
	List<Task> nodes = new ArrayList<Task>();

	public void addLink(Task from, Task to) {
		to.addEdgeIn(from);
		from.addEdgeOut(to);
		
		if (!nodes.contains(from)) {
			nodes.add(from);
		}
		
		if (!nodes.contains(to)) {
			nodes.add(to);
		}
	}

	public boolean isCyclic() {
		for (Task n : this.nodes) {
			if (n.isCyclic()) {
				return true;
			}
		}
		return false;
	}

	public String toString() {
		String sb = "";
		for (Task task : nodes) {
			sb += task.toString() + "\n";
		}
		return sb;
	}
}