import java.util.Arrays;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class Cluster {
	private Rack[] children = new Rack[0];
	static boolean verbose = false;

	public static int defaultRackSize = 8;

	public static void main(String[] args) {
		// Testing bench for Cluster class
		verbose = true;

		Cluster sampleCluster = new Cluster(defaultRackSize);
		Rack sampleRack = new Rack();
		sampleCluster.addRack(sampleRack);

		if (verbose){
			sampleCluster.logger();
		}
	}

	public Cluster(int rackSize) {
		this.setDefaultRackSize(rackSize);
		Rack firstChild = new Rack(rackSize); // ain't no cluster with no racks in it
		this.addRack(firstChild);
	}
	public Cluster() {
		Rack firstChild = new Rack(defaultRackSize);  // uses Rack's default size
		this.addRack(firstChild);
	}
	public Cluster(String fileName) throws FileNotFoundException {
		File file = new File(fileName);
		Scanner fileStream = new Scanner(file);

		int nodesPerRack = Integer.parseInt(fileStream.nextLine());
		this.setDefaultRackSize(nodesPerRack);
		Rack firstChild = new Rack(nodesPerRack);

		while (fileStream.hasNextLine()) {
			String[] newSet = fileStream.nextLine().split(" ");
			int numberOfNodes = Integer.parseInt(newSet[0]);
			int memorySize = Integer.parseInt(newSet[1]);
			int numberOfCpu = Integer.parseInt(newSet[2]);
			for (int i=0; i < numberOfNodes; i++){
				Node newNode = new Node(memorySize, numberOfCpu);
				this.addNodeToCluster(newNode);	
			}
		}
	}

	public void addRack(Rack rack) {
		this.children = Arrays.copyOf(this.children, this.children.length+1);
		this.children[children.length-1] = rack;
	}

	public Rack[] getRacks(){
		return this.children;
	}

	public void addNodeToARack(Node node) {
		for (Rack rack : this.children){
			if (rack.hasSpace()) {
				rack.addNode(node);
				return;
			}
		}

		// if we reach here, none of the current racks have space in them
		Rack newChild = new Rack(defaultRackSize);
		this.addRack(newChild);
		newChild.addNode(node);
	}

	public void addNodeToCluster(Node node){
		this.addNodeToARack(node);
	}

	public void logger(){
		System.out.printf("Cluster has %d racks: \n", this.children.length);
		for (Rack rack : this.children){
			rack.logger();
		}
	}

	public int totalCpuInCluster(){
		int sum = 0;
		for (Rack rack : this.children){
			sum += rack.totalCpuInRack();
		}
		return sum;
	}

	public int countRacksInCluster() {
		return this.children.length;
	}

	public int countNodesWithMinGB(int minGB){
		int sum = 0;
		for (Rack rack : this.getRacks()){
			sum += rack.countNodesWithMinGB(minGB);
		}
		return sum;
	}

	public void setDefaultRackSize(int newSize){
		defaultRackSize = newSize;
	}


}