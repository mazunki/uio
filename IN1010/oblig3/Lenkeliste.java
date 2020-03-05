public class Lenkeliste<T> implements Liste<T> {
	class Node {
		Node next;
		Node previous;
		T data;

		public Node(T data) {
			this.data = data;
		}
		public void setNext(Node newNode) {
			this.next = newNode;
		}
		public void setPrevious(Node newNode) {
			this.previous = newNode;
		}
		public void removeNext(){
			this.next = null;
		}
		public void removePrevious(){
			this.previous = null;
		}
		public Node getNext(){
			return this.next;
		}
		public Node getPrevious(){
			return this.previous;
		}
		public T getData(){
			return this.data;
		}
		public void setData(T newData){
			this.data = newData;
		}
		public int getPosition() {
			if (this.previous == null) {
				return 0; // zero-indexed
			} else {
				return this.previous.getPosition() + 1;
			}
		}
		public int getFollowers() {
			if (this.next == null) {
				return 0;
			} else {
				return this.next.getFollowers() + 1;
			}
		}
		public String toString() {
			if (this.next == null)
				return this.data.toString();
			else
				return this.data.toString() + "," + this.next.toString();
		}
	}

	Node startNode;

	public int stoerrelse() {
		if (this.startNode == null) {
			return 0;
		} else {
			return this.startNode.getFollowers() + 1;
		}
	}
	public void leggTil(int pos, T x) {
		if (this.startNode == null && pos != 0) {
			throw new UgyldigListeIndeks(pos);
		} else if (pos > this.stoerrelse() || pos < 0) {
			// outside of FIFO stack (pos > end+2 or pos < 0)
			throw new UgyldigListeIndeks(pos);
		} else if (pos == 0 && this.startNode != null) { // insert into top of FIFO stack
			Node newNode = new Node(x);
			newNode.setNext(this.startNode);
			this.startNode.setPrevious(newNode);
			this.startNode = newNode;
		} else if (pos == this.stoerrelse()) {
			// end of stack
			this.leggTil(x);
		} else {
			// middle of stack
			Node newNode = new Node(x);
			Node prevNode = this.startNode;
			for (int i=0; i<pos-1; i++){
				prevNode = prevNode.getNext();
			}
			Node nextNode = prevNode.getNext();

			newNode.setPrevious(prevNode);
			newNode.setNext(nextNode);
			prevNode.setNext(newNode);
			nextNode.setPrevious(newNode);

		}
		//System.out.println(this.startNode);
	}
	public void leggTil(T x) {
		if (this.startNode == null) {
			this.startNode = new Node(x);
		} else {
			Node newNode = new Node(x);
			Node lastNode = this.startNode;
			while (lastNode.getNext() != null) {
				lastNode = lastNode.getNext();
			}

			lastNode.setNext(newNode);
			newNode.setPrevious(lastNode);
			
		}
		//System.out.println(this.startNode);
	}
	public void sett(int pos, T x) throws UgyldigListeIndeks {
		if (this.startNode == null) {
			throw new UgyldigListeIndeks(pos); // uninited list
		} else if (pos == this.stoerrelse()) { // tangent to stack
			throw new UgyldigListeIndeks(pos);
		} else if (pos > this.stoerrelse() || pos < 0) { // outside of FIFO stack
			throw new UgyldigListeIndeks(pos);
		} else if (pos == this.stoerrelse()-1) { // no next element (last element)
			Node newNode = new Node(x);
			Node prevNode = this.startNode;
			while (prevNode.getNext() != null) {
				prevNode = prevNode.getNext();
			}
			prevNode.setNext(newNode);
			newNode.setPrevious(prevNode);
		} else if (pos == 0) { // no previous element
			Node nextNode = this.startNode.getNext();
			Node newNode = new Node(x);
			nextNode.setPrevious(newNode);
			this.startNode = newNode;
			newNode.setNext(nextNode);
		} else { // middle of stack
			Node newNode = new Node(x);
			Node prevNode = this.startNode;
			for (int i=0; i<pos-1; i++) {
				prevNode = prevNode.getNext();
			}
			Node nextNode = prevNode.getNext().getNext();

			newNode.setNext(nextNode);
			newNode.setPrevious(prevNode);
			prevNode.setNext(newNode);
			nextNode.setPrevious(newNode);
		}
	}
	public T hent(int pos) throws UgyldigListeIndeks {
		//System.out.println(this.startNode);
		if (pos >= this.stoerrelse() || pos < 0) { // covers pos==start if start=null
			throw new UgyldigListeIndeks(pos);
		} else {
			Node posNode = this.startNode;
			for (int i=0; i<pos; i++) {
				posNode = posNode.getNext();
			}
			return posNode.getData();
		}
	}
	public T fjern(int pos) throws UgyldigListeIndeks {
		//System.out.println(this.startNode);
		if (pos >= this.stoerrelse() || pos < 0) { // covers pos==start if start=null
			throw new UgyldigListeIndeks(pos);
		} else if (pos == 0) {  // no previous element
			T data = this.startNode.getData();
			
			if (this.startNode.getNext() != null) { // if not single element in list
				Node nextNode = this.startNode.getNext();
				nextNode.setPrevious(null);
				this.startNode = nextNode;
			} else {
				this.startNode = null;
			}
			return data;
		} else if (pos == this.stoerrelse()-1) { // no next element
			Node posNode = this.startNode;
			for (int i=0; i<pos; i++) {
				posNode = posNode.getNext();
			}

			Node prevNode = posNode.getPrevious();
			prevNode.setNext(null);
			return posNode.getData();
		} else { // middle of stack
			Node posNode = this.startNode;
			for (int i=0; i<pos; i++) {
				posNode = posNode.getNext();
			}

			
			Node nextNode = posNode.getNext();
			Node prevNode = posNode.getPrevious();
			
			if (prevNode != null) {
				prevNode.setNext(nextNode);
			}

			nextNode.setPrevious(prevNode);

			return posNode.getData();
		}
	}
	public T fjern() throws UgyldigListeIndeks {
		return this.fjern(0);
	}

}

