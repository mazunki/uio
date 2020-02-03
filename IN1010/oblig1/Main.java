import java.io.FileNotFoundException;

public class Main {
	public static void main(String[] args) throws FileNotFoundException {


		System.out.println("Abel cluster:");
		Cluster abel = new Cluster(12);
		for (int i=0; i<650; i++){
			Node node = new Node(64, 1);
			abel.addNodeToCluster(node);
		}
		for (int i=0; i<16; i++){
			Node node = new Node(1024, 2);
			abel.addNodeToCluster(node);
		}

		System.out.println("Nodes with at least 32 GiB: " + abel.countNodesWithMinGB(32));
		System.out.println("Nodes with at least 64 GiB: " + abel.countNodesWithMinGB(64));
		System.out.println("Nodes with at least 128 GiB: " + abel.countNodesWithMinGB(16));

		System.out.println("Total number of processors: " + abel.totalCpuInCluster());
		System.out.println("Total number of racks: " + abel.countRacksInCluster());

		System.out.println();

		System.out.println("File cluster:");
		Cluster cl = new Cluster("clusterdata.txt");

		System.out.println("Nodes with at least 32 GiB: " + cl.countNodesWithMinGB(32));
		System.out.println("Nodes with at least 64 GiB: " + cl.countNodesWithMinGB(64));
		System.out.println("Nodes with at least 128 GiB: " + cl.countNodesWithMinGB(16));

		System.out.println("Total number of processors: " + cl.totalCpuInCluster());
		System.out.println("Total number of racks: " + cl.countRacksInCluster());
	}
}