package src.ch06_re;

public class _01_Dog extends _01_Animal{
	
	// 부모클래스(_01_Animal)을 상속받는다
	
	// _01_Dog 클래스만 갖고 있는 멤버 변수
	private String stroll;  // 산책
	
	// 생성자
	public _01_Dog() {
		System.out.println(" <<< _01_Dog 자식클래스 >>>");
	}
	
	// 멤버메서드
	public void bark() {
		System.out.println("아옹");
	}
	
	// getter setter
	public String getStroll() {
		return stroll;
	}
	public void setStroll(String stroll) {
		this.stroll = stroll;
	}
	
	public void printInfo() {
		System.out.println("산책 :" +stroll);
	}

}
