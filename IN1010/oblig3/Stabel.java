public class Stabel<T> extends Lenkeliste<T> {
	public void leggPaa(T x) {
		this.leggTil(this.stoerrelse(), x);
	}

	public T taAv() {
		return this.fjern(this.stoerrelse()-1);
	}
}