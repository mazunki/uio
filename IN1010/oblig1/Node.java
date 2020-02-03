public class Node {
	private int memorySize; // in GiB
	private int numCPU;
<<<<<<< HEAD
	private int positionInRack; // index
	private int maxNodes = 2;
=======
	private int positionInRack = -1; // index
>>>>>>> 60059e8859ab7490b6ef1a9c2d4a2099df4450fb

	static boolean verbose = false;

	public static void main(String[] args) {
		// Testing bench for Node class
		verbose = true;

		// Sample 1, works
		try {
			Node sampleNode = new Node(64, 2);
		} catch (ExceptionInInitializerError err) {
			System.out.println("Exceptions were found but ignored. " + err);
		}

		// Sample 2, logs an Exception
		try {
			Node sampleNode1 = new Node(-64, 2);  // Throws Exception 
		} catch (ExceptionInInitializerError err) {
			System.out.println("Exceptions were found but ignored: " + err);
		}

		// Sample 3, logs an Exception
		try {
			Node sampleNode3 = new Node(64, 3);
		} catch (ExceptionInInitializerError err) {
			System.out.println("Exceptions were found but ignored: " + err);
		}
	}
	public Node(int memorySize, int numCPU) throws ExceptionInInitializerError {
		if (memorySize <= 0){
			throw new ExceptionInInitializerError("Memory size must be positive. Got " + Integer.toString(memorySize) + ".");
		}
		if (numCPU <= 0 || numCPU > maxNodes){
			throw new ExceptionInInitializerError("Node only supports one or two CPUs. Got " + Integer.toString(numCPU) + ".");
		}

		this.memorySize = memorySize;
		this.numCPU = numCPU;

		if (verbose) {
			this.logger();
		}
	}

	public int getMemorySize(){
		return this.memorySize;
	}
	public boolean hasAtLeastMemory(int minGB){
		return (this.memorySize >= minGB);
	}

	public void setMemorySize(int newSize){
		this.memorySize = newSize;
	}

	public void addCPU() {

		this.numCPU++;
	}
	public void remCPU() {
		this.numCPU--;
	}
	public int getCPU() {
		return this.numCPU;
	}

	public void logger() {
		String log = String.format("<Node, with %d CPU units, and %d of memory size.>", this.numCPU, this.memorySize);
		System.out.println(log);
	}

	public void setPosition(int index){
		this.positionInRack = index;
	}
	public int getPosition() {
		return this.positionInRack;
	}
}