import java.util
.Arrays;

public class Rack {
	int capacity;
	private Node[] children;
	static boolean verbose = false;

	public static void main(String[] args) {
		// Testing bench for Rack class
		verbose = true;

		Rack sampleRack = new Rack();
		Node sampleNode = new Node(32, 2);
		sampleRack.addNode(sampleNode);
		Node sampleNode1 = new Node(16, 2);
		sampleRack.addNode(sampleNode1);
		try {
			sampleRack.addNode(sampleNode1);
		} catch (IllegalStateException err) {
			System.out.println("Exceptions were found but ignored. " + err);
		}


		if (verbose) {
			sampleRack.logger();
		}
	}

	public Rack(int capacity) {
		this.capacity = capacity;
		this.children = new Node[this.capacity];  // Creating slots for the Nodes in the Rack
	}
	public Rack() {
		this(8);  // default rack size of 8 Nodes
	}

	public int addNode(Node node) {  // returns index of node
		// we don't want duplicates
		for (Node child : this.children) {
			if (node == child) {
				throw new IllegalStateException("<Node is already placed here! Please remove it first!>");
			}
		}

		if (node.getPosition() != -1) {  // we don't want things to break if Node is running
			// node.safeShutdown();
			node.setPosition(-1);
		}

		// running through Rack's slots
		for (int i=0; i < this.children.length; i++) {
			if (this.children[i] == null) { // once we find an empty slot, we place the node
				this.children[i] = node;
				node.setPosition(i);
				return i;
			}
		}
		throw new IllegalStateException("<Rack is full. Could't add Node.>");
	}

	public int removeNode(Node node){ // returns old position
		for (int i=0; i < this.children.length; i++) {
			if (node == this.children[i]) {
				this.children[i] = null;
				node.setPosition(-1);
				return i;
			}
		}
		throw new IllegalStateException("<Node is not in this Rack. Couldn't remove Non-Existant Node.>");
	}

	public Node[] getNodes() {
		Node[] actualNodes = new Node[0];
		for (Node node : this.children) {
			if (node != null){
				actualNodes = Arrays.copyOf(actualNodes, actualNodes.length+1);
				actualNodes[actualNodes.length-1] = node;
			}
		}
		return actualNodes;
	}
	public void logger() {
		System.out.printf("Rack with %d slots: { \n", this.capacity);
		for (Node child : this.children) {
			System.out.print("\t");
			if (child != null){
				child.logger();
			} else {
				System.out.println("<Empty>");
			}
		}
		System.out.println("}");
	}

	public boolean isFull() {
		for (Node child : this.children) {
			if (child == null) {
				return false;
			}
		}
		return true;
	}

	public boolean hasSpace() {
		return !this.isFull();
	}

	public int totalCpuInRack(){
		int sum = 0;
		for (Node node : this.getNodes()){
			sum += node.getCPU();
		}
		return sum;
	}
	public int countNodesWithMinGB(int minGB){
		int sum = 0;
		for (Node node : this.getNodes()){
			if (node.hasAtLeastMemory(minGB)){
				sum++;
			}
		}
		return sum;
	}
}