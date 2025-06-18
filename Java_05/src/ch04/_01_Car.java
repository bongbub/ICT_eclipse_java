package ch04;

public class _01_Car {
	// 2025.5.28
	
	
	// 멤버 변수
	private String brand;      // 볼보     제네시스
	private int price;         // 6000    1000000
	private String madein;     // 스웨덴    한국
	private String color;      // grey    pink
	
	
	// 디폴트 생성자
	public _01_Car() {}
	
	
	// 매개변수 생성자
	public _01_Car(String brand, int price, String madein, String color) {
		this.brand = brand;
		this.price = price;
		this.madein = madein;
		this.color = color;
	}
	
	
	// 멤버메서드 (getter, setter)
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getMadein() {
		return madein;
	}
	public void setMadein(String madein) {
		this.madein= madein;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color=color;
	}
	
	
	// 멤버메서드 printInfo()   ... 멤버변수 정보를 출력
	public void printInfo() {
		System.out.println("-회사 : "+brand);
		System.out.println("-가격 :"+price);
		System.out.println("-제조국 :"+madein);
		System.out.println("-색상 :"+color);
	}

}
