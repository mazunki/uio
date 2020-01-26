class Counter {
	private int value;
	public static void main(String[] args){
		Counter my_counter = new Counter(0);
		for (int i=0; i<10; i++){
			System.out.println("Adding " + i + " to " + my_counter.getValue());
			my_counter.addValue(i);
			System.out.println("Got " + my_counter.getValue());
		}
	}
	public Counter(int startValue){
		this.value = startValue;
	}
	public int getValue(){
		return this.value;
	}
	public void addValue(int sum){
		this.value += sum;
	}
}

