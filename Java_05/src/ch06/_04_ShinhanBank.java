package ch06;

// 2025.6.2

public class _04_ShinhanBank extends _04_Bank{
	
	// 신한은행
	// 방법 1)
	// 디폴트생성자 + setter로 값 전달
	
	private String event;		// 금리인하
	
	// 상속받아주기
	
	public _04_ShinhanBank() {
		
	}
	
	// getter setter
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	
	
	// 멤버메서드
	public void executeLoan() {
		System.out.println("신한은행 대출");
	}
	
	// 부모 메서드를 오버라이드 함
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("이벤트 : "+event);
	}
	
	

}
