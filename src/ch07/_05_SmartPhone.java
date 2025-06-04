package ch07;

// 2025.6.4 (7교시)
// 다중상속과 구현


// 자식클래스
// 자식클래스가 부모클래스를 상속받고, 인터페이스 구현을 동시에 진행.
// 4. 상속과 구현을 동시 (((((( 중요 ))))))
// class 자식클래스명 extends 부모클래스 implements 인터페이스명1, .. 인터페이스명n {}
public class _05_SmartPhone extends _05_PDA implements _05_Mobile, _05_Mp3 {

	@Override
	public void play() {
		System.out.println("음악을 연주하다.");
	}

	@Override
	public void stop() {
		System.out.println("음악을 멈추다.");
	}

	@Override
	public void sendSMS() {
		System.out.println("문자를 보낸다.");
	}

	@Override
	public void receieSMS() {
		System.out.println("문자를 받는다.");
	}
	
//	@Override
//	public int calculate(int x, int y) {
//		return x+y;
//	}
	
	

}
