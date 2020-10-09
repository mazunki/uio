import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import java.util.HashMap;
import java.util.ArrayList;

class Oblig2 {
	public static void main(String[] args) {
		Graph graph = Oblig2.readFromTextFile(args[0]);
		if (graph.isCyclic()) {
			System.out.println("Hey! That's impossible!");
		} else {
			graph.calculateTimings();
			graph.simulateRush();
		}
	}

	public static Graph readFromTextFile(String filename) {
		Graph graph = new Graph();
		HashMap<Integer, Task> taskmap = new HashMap<Integer, Task>();
		HashMap<Task, ArrayList<Integer>> helper = new HashMap<Task, ArrayList<Integer>>();

		try {
	     	File file = new File(filename);
	    	Scanner sc = new Scanner(file);

	    	String numberOfTasks = sc.nextLine();
	    	sc.nextLine();
	    	while (sc.hasNextLine()) {
	    		int id = sc.nextInt();
	    		//sc.nextLine();

	    		String name = sc.next();

	    		int time = sc.nextInt();
	    		//sc.nextLine();

	    		int manpower = sc.nextInt();
	    		//sc.nextLine();

	    		//System.out.println("Creating node " + id + " " + time + " " + manpower + " " + name);
	    		Task newTask = new Task(id, time, manpower, name);
	    		taskmap.put(id, newTask);
	    		helper.put(newTask, new ArrayList<Integer>());
	    		while (!sc.hasNext("0")) {
	    			int dependency = sc.nextInt();
	    			helper.get(newTask).add(dependency);
	    			//sc.nextLine();
	    		}
	    		sc.nextLine(); // skip 0 as end of task
	    	}

	    	for (HashMap.Entry<Task, ArrayList<Integer>> pairs : helper.entrySet()) {
    			//System.out.println("Trying to access " + pairs + " of " + taskmap);
    			for (int task : pairs.getValue()) {
    				graph.addLink(taskmap.get(task), pairs.getKey());
    			}
	    	}

	    } catch (FileNotFoundException f) {
	    	System.out.println("File not found.");
	    	System.exit(1);
	    }

	    return graph;
	}

	public void sample() {
		Graph graph = new Graph();

		Task n1 = new Task(1, 3, 4, "one");
		Task n2 = new Task(2, 5, 2, "two");
		Task n3 = new Task(3, 1, 2, "three");
		Task n4 = new Task(4, 2, 4, "four");
		Task n5 = new Task(5, 4, 3, "five");
		Task n6 = new Task(6, 8, 4, "six");
		Task n7 = new Task(7, 3, 2, "seven");
		Task n8 = new Task(8, 1, 3, "eight");

		graph.addLink(n1, n3);
		graph.addLink(n2, n3);
		graph.addLink(n2, n4);
		graph.addLink(n3, n5);
		graph.addLink(n3, n6);
		graph.addLink(n4, n6);
		graph.addLink(n5, n7);
		graph.addLink(n6, n7);
		graph.addLink(n6, n8);

		// graph.addLink(n4, n3);
		// graph.addLink(n5, n4);

		//System.out.println(graph);
		graph.calculateTimings();
		graph.simulateRush();
	}
}