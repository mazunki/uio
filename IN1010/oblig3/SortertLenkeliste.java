public class SortertLenkeliste<T extends Comparable<T>> extends Lenkeliste <T> {
	public void leggTil(T x) {
		if (this.stoerrelse() == 0) {
			super.leggTil(x);
			//System.out.println(this.startNode);
			return;
		}

		int insertIdx = 0;
		for (int i=0; i<this.stoerrelse(); i++) {
			if (this.hent(i).compareTo(x) < 0) {
				insertIdx = i+1;
			}
		}
		//System.out.println(prevNodeIdx);
		if (insertIdx == 0) {
			super.leggTil(0, x);
		} else if (insertIdx == this.stoerrelse()) {
			super.leggTil(x);
		} else {
			super.leggTil(insertIdx, x);
		}

		// System.out.println("Prev node" + insertIdx);
		// System.out.println("Added " + x);
		// System.out.println(this.startNode);
	}

	public T fjern(){
		T fjernValue = this.hent(0);
		int fjernId = 0;
		for (int i=0; i<this.stoerrelse(); i++) {
			T iValue = this.hent(i);
			if (iValue.compareTo(fjernValue) > 0) {
				fjernValue = iValue;
				fjernId = i;
			}

		}
		return fjern(fjernId);
	}

	public void sett(int pos, T x) throws UnsupportedOperationException {
		if (pos == 0) {
			if (this.startNode == null) {
				throw new UnsupportedOperationException();
			} else {
				if (x.compareTo(this.startNode.getNext().getData()) < 0) {
					super.sett(0, x);
				} else {
					throw new UnsupportedOperationException();
				}
			}
		} else if (pos == this.stoerrelse()-1) { // last Node
			if (this.hent(pos-1).compareTo(x) < 0) {
				super.sett(pos, x);
			} else {
				throw new UnsupportedOperationException();
			}
		} else if (pos == this.stoerrelse() ) {  // tangent to stack 
			throw new UnsupportedOperationException();
		} else if (pos > 0 && pos < this.stoerrelse()-1 ) { // middle of stack
			T prevNodeVal = this.hent(pos-1);
			T nextNodeVal = this.hent(pos+1);

			if (prevNodeVal.compareTo(x) < 0 && x.compareTo(nextNodeVal) < 0) {
				super.sett(pos, x);
			} else {
				throw new UnsupportedOperationException();
			}
		} else { // outside of stack
			throw new UnsupportedOperationException();
		}
	}

	public void leggTil(int pos, T x) {
		if (pos == 0) {
			if (this.startNode == null) {
				throw new UnsupportedOperationException();
			} else {
				if (x.compareTo(this.startNode.getNext().getData()) < 0) {
					super.leggTil(0, x);
				} else {
					throw new UnsupportedOperationException();
				}
			}
		} else if (pos == this.stoerrelse()-1) { // last Node
			if (this.hent(pos-1).compareTo(x) < 0) {
				super.sett(pos, x);
			} else {
				throw new UnsupportedOperationException();
			}
		} else if (pos == this.stoerrelse() ) {  // tangent to stack 
			throw new UnsupportedOperationException();
		} else if (pos > 0 && pos < this.stoerrelse()-1 ) { // middle of stack
			T prevNodeVal = this.hent(pos-1);
			T nextNodeVal = this.hent(pos+1);

			if (prevNodeVal.compareTo(x) < 0 && x.compareTo(nextNodeVal) < 0) {
				super.leggTil(pos, x);
			} else {
				throw new UnsupportedOperationException();
			}
		} else { // outside of stack
			throw new UnsupportedOperationException();
		}
	}
}