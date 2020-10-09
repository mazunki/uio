import java.util.List;
import java.util.ArrayList;

class Graph {
	List<Task> nodes = new ArrayList<Task>();
	int totalTime;

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

	public void calculateTimings() {
		this.totalTime = 0;
		for (Task task : this.nodes) {
			task.calculateTimings();
			if (task.latestStart + task.time > this.totalTime) {
				this.totalTime = task.latestStart + task.time;
			}
		}
	}

	public String toString() {
		String sb = "";
		for (Task task : nodes) {
			sb += task.toString() + "\n";
		}
		return sb;
	}

	public void simulateLazy() {
		int staff = 0;
		for (int i=0; i<=this.totalTime; i++) {
			boolean printTime = false;
			for (Task t : this.nodes) {
				if (t.latestStart == i) {
					if (!printTime) {
						System.out.println("Time " + i + ":");
						printTime = true;
					}
					System.out.println("\tStarting: " + t.name);
					staff += t.manpower;
				} else if (t.latestStart + t.time == i) {
					if (!printTime) {
						System.out.println("Time " + i + ":");
						printTime = true;
					}
					System.out.println("\tEnding: " + t.name);
					staff -= t.manpower;
				}
			}
			if (printTime) {
				System.out.println("\tManpower: " + staff);
			}
		}
		System.out.println();
		System.out.println("Done! The project takes at minimum " + this.totalTime + " time units");
	}

	public void simulateRush() {
		int staff = 0;
		for (int i=0; i<=this.totalTime; i++) {
			boolean printTime = false;
			for (Task t : this.nodes) {
				if (t.earliestStart == i) {
					if (!printTime) {
						System.out.println("Time " + i + ":");
						printTime = true;
					}
					System.out.println("\tStarting: " + t.name);
					staff += t.manpower;
				} else if (t.earliestStart + t.time == i) {
					if (!printTime) {
						System.out.println("Time " + i + ":");
						printTime = true;
					}
					System.out.println("\tEnding: " + t.name);
					staff -= t.manpower;
				}
			}
			if (printTime) {
				System.out.println("\tManpower: " + staff);
			}
		}
		System.out.println();
		System.out.println("Done! The project takes at minimum " + this.totalTime + " time units");
	}
}