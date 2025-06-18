package ch07;

//2025.6.4 (4교시)
//추상클래스 + 템플릿메서드


public class _02_CarMain {
	public static void main(String[] args) {
		
		
		System.out.println("== 자율주행자동차 ==");
		_02_Car ai = new _02_AICar();
		ai.run();
		
		System.out.println("-----------------");
		
		System.out.println("== 사람운전자동차 ==");
		_02_Car man = new _02_ManualCar();
		man.run();
	}
}
