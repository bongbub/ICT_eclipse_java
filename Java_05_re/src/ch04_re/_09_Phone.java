package src.ch04_re;

public class _09_Phone {

	private String model; // 모델명
	private int price; // 가격

	public _09_Phone() {

	}

	public _09_Phone(String model, int price) {
		this.model = model;
		this.price = price;
	}

	// 멤버메서드 getter setter
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
