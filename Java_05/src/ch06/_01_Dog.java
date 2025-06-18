package ch06;

// 2025.5.30
// 자식클래스
public class _01_Dog extends _01_Animal{

	// 멤버 변수	
	private String stroll;  // 고유
	
	
		// 생성자
	public _01_Dog() {
		System.out.println(" <<< 01_Dog 자식클래스 >>>");
	}
	
	public void bark() {
		System.out.println("아오올ㄹ");
	}
		
	// getter setter
	public String getStroll() {
		return stroll;
	}
	public void setStroll(String stroll) {
		this.stroll = stroll;
	}
	
	
	// @Override => 부모 메서드 재정의
	// 재정의하는 것을 컴파일에게 알림
	// 호출순위 : 자식메서드 > 부모메서드
	@Override
	// 멤버 메서
	public void printInfo() {
		// 부모의 함수 호출 -> super.
		super.printInfo();
		System.out.println("산책 :"+stroll);
		
	}
	
	
}
