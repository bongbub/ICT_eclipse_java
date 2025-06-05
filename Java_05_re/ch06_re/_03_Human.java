package ch06_re;

public class _03_Human extends _03_Animal{
	
	// 부모도 갖고 있는 메서드 재정의
	public void move() {
		System.out.println("사람이 움직인당");
	} 
	
	// Human만 갖고 있는 메서드
	public void voice() {
		System.out.println("사람이 소리를 냅니다");
	}
	
}
