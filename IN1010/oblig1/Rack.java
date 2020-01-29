

public class Rack {
	int capacity;
	private Node[] children;

	public static void main(String[] args) {
		// Testing bench for Rack class

		Rack sampleRack = new Rack();
		Node sampleNode = new Node(32, 2);
		sampleRack.addNode(sampleNode);
	}

	public Rack(int capacity) {
		this.capacity = capacity;
		this.children = new Node[this.capacity];  // Creating slots for the Nodes in the Rack
	}
	public Rack() {
		this(8);  // default rack size of 8 Nodes
	}

	public int addNode(Node node){  // returns index of node
		for (int i=0; i < this.children.length; i++) {
			System.out.println(this.children[i]);
			if (this.children[i] == null) {
				this.children[i] = node;
				break;
			}
		}
		return 0;
	}
}