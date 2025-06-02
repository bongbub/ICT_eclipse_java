package ch06;


// 2025.6.2 (3교시)
public class _02_CarMain {
	public static void main(String[] args) {
		
		// _02_FireCar 자식클래스 정보 + 공통기능 출력
		_02_FireCar fc = new _02_FireCar();
		fc.setKind("소방차");
		fc.setSpeed(2000);
		fc.water();
		fc.printInfo();
		System.out.println("");
		
		
		
		// _02_PoliceCar 자식클래스 정보 + 공통기능 출력
		_02_PoliceCar pc = new _02_PoliceCar();
		pc.setKind("경찰차");
		pc.setSpeed(3000);
		pc.siren();
		System.out.println("");
	}
}