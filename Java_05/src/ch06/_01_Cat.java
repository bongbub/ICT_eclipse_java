package ch06;

//2025.5.30
// 자식 클래스
public class _01_Cat extends _01_Animal{
	
	// 멤버 변수
	private String cute; 	// 고유
	
	
	
	// 생성자
	public _01_Cat() {
		
		super();   // 부모디폴트 생성자 (생략 O 컴파일러가 알아서 생성)
		System.out.println(" <<< 01_Cat 자식클래스 >>>");
	}
	
	// 멤버 메서드
	public void cry() {
		System.out.println("애웅");
	}
	
	// getter setter
	public String getCute() {
		return cute;
	}
	public void setCute(String cute) {
		this.cute = cute;
	}

	
	// @Override -> 부모 메서드 재정의
	// 재정의하는 것을 컴파일에게 알림
	// 호출순위 자식메서드 > 부모메서드
	
	@Override
	// 멤버변수 정보 출력 printInfo()
	public void printInfo() {
		// 부모의 함수 호출 -> super.
		// 부모.printInfo()
		super.printInfo();   // 부모의 참조변수접근
		System.out.println("애교 :"+cute);
		
		
	}
	
	
}
