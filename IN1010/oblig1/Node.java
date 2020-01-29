public class Node {
	private int memorySize; // in GiB
	private int numCPU;
	private int positionInRack; // index

	boolean verbose = true;

	public static void main(String[] args) {
		// Testing bench for Node class

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
			Node sampleNode = new Node(64, 3);
		} catch (ExceptionInInitializerError err) {
			System.out.println("Exceptions were found but ignored: " + err);
		}
	}
	public Node(int memorySize, int numCPU) throws ExceptionInInitializerError {
		if (memorySize <= 0){
			throw new ExceptionInInitializerError("Memory size must be positive. Got " + Integer.toString(memorySize) + ".");
		}
		if (numCPU != 1 && numCPU != 2){
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
		String log = String.format("<New Node created, with %d CPU units, and %d of memory size.>", this.numCPU, this.memorySize);
		System.out.println(log);
	}

	public void setPosition(int index){
		this.positionInRack = index;
	}
	public int getPosition() {
		return this.positionInRack;
	}
}