
class Oblig2 {
	public static void main(String[] args) {
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

		System.out.println(graph);
		System.out.println(graph.isCyclic());
	}
}