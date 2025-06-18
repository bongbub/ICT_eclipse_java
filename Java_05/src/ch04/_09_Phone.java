package ch04;

// 2025.05.29
// 167페이지
public class _09_Phone {
	// 멤버변수
	private String model;
	private double price;

	// 디폴트 생성자
	public _09_Phone() {
	}

	// 매개변수 생성자
	public _09_Phone(String model, double price) {
		this.model = model;
		this.price = price;
	}

	// 멤버메서드 (getter, setter)
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public double getPrice() {
		return price;
	}

	public void setPirce(double price) {
		this.price = price;
	}
	
	
	//
	public void buyPhone() {
		// 구입완료를 출력
		
	}
	
	

	public void printInfo() {
		System.out.println("model :" + model);
		System.out.println("price :" + price);
		System.out.println("");
	}

}
