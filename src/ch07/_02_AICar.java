package ch07;


// 2025.6.4 (4교시)
// 추상클래스 + 템플릿메서드


// 자식클래스
public class _02_AICar extends _02_Car {

	@Override
	public void drive() {
		System.out.println("자동운전함");		
	}

	@Override
	public void stop() {
		System.out.println("자동정지");
	}

}
