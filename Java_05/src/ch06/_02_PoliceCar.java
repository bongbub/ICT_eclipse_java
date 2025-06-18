package ch06;


// 2025.6.2(2교시)
// 자식클래스
public class _02_PoliceCar extends _02_Car{
	
	// 디폴트 생성자
	public _02_PoliceCar() {
		System.out.println(" ~ PoliceCar ~");
	}
	
	// 멤버메서드
	public void siren() {
		super.printInfo();
		System.out.println("웽~~~~~~~~~~~~~~~~~~~~~~~");
	}

}
