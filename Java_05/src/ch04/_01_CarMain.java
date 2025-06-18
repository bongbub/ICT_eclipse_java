package ch04;

public class _01_CarMain {
	public static void main(String[] args) {
		
		
		// 디폴트 생성자
		_01_Car car1 = new _01_Car();
		
		// setter 초기화
		car1.setBrand("볼보");
		car1.setMadein("스웨덴");
		car1.setPrice(6000);
		car1.setColor("white");
		
		System.out.println("사고싶은 차량~! 첫~번~째~~~");
		car1.printInfo();
		System.out.println("");
		
		// 매개변수 생성자
		_01_Car car2 = new _01_Car("제네시스", 100000, "한국", "black");
		System.out.println("사고싶은 차량~! 두 번~째~~~");
		car2.printInfo();
	}

}