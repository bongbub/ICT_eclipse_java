package ch06;

	//2025.6.2 (2교시)
	// 부모클래스

public class _02_Car {
	
	// 멤버변수
	private String kind;	// 소방차	경찰차
	private int speed;		// 2000 3000
	
	// 디폴트 생성자
	public _02_Car() {
		System.out.println(" ~ 부모 디폴트 생성자 ~");
	}
	
	// 매개변수 생성자
	public _02_Car(String kind, int speed) {
		this.kind = kind;
		this.speed = speed;
		System.out.println("");
	}
	
	// getter setter
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	// 출력
	public void printInfo() {
		System.out.println("kind :"+ kind);
		System.out.println("speed :"+speed);
	}
	
	
}
