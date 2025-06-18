package ch06;

//p268
//2025.6.2 (6교시)


// 자식클래스
public class _05_Human extends _05_Animal {
	@Override // 생략가능
	public void move() {
		System.out.println("사람이 두 발로 걷습니다.");
	}
	
	
	public void readBook() {
		System.out.println("사람이 독서를 합니다.");
	}

}
