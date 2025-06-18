package ch07;

// 2025.6.5 (5교시)

public class _07_InterfaceEx {
	public static void main(String[] args) {

		// autoPlay() 호출
		A07 a = new A07();
		a.autoPlay(new B07());
		a.autoPlay(new C07());

	}
}

// 부모 클래스
class A07 {
	public void autoPlay(I07 i07) { // 매개변수 다형성 적용
		// I07.play를 호출
		// 추상메서드 호출 -> 재정의된 자식메서드 호출
		i07.play();
		try {
			Thread.sleep(3000); // 3초 지연
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}
}

// 인터페이스
interface I07 {
	public void play(); // 추상메서드
}

// 자식클래스 - I07 인터페이스 구현
class B07 implements I07 {

	public void play() {
		System.out.println("B07 -> play() 호출");
	}
}

// 자식클래스 = I07 인터페이스 구현
class C07 implements I07 {
	public void play() {
		System.out.println("C07 -> play() 호출");

	}
}