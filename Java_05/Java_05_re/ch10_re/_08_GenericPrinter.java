package ch10_re;

// 2025.6.13 	복습


// 제네릭예제 제네릭프린터
public class _08_GenericPrinter<T> {

	private T material;
	
	public void setMetarial(T material) {
		this.material = material;
	}
	public T getMeterial() {
		return material;
	}
	public String toStirng() {
		return material.toString();
	}
}
