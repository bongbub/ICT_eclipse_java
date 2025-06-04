package ch07;

// 2025.6.4 (7교시)
// 인터페이스 예제


// 자식클래스
public class _04_SamsungTV implements _04_TV{

	@Override
	public void turnOn() {
		System.out.printf("%s TV를 켜다",BRAND);
		
	}

	@Override
	public void turnOff() {
		System.out.printf("%s TV를 끄다",BRAND);
	}

}
