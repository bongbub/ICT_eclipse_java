package ch10;

// 2025.6.13	7교시

public class _08_GenericPrinter<T> {
	private T material;
	
	public void setMaterial (T mateial) {
		this.material = mateial;
	}
	
	public T getMaterial() {
		return material;
	}
	
	public String toString() {
		return material.toString();
	}
}
