package ch06;

//p268
//2025.6.2 (6교시)


//자식클래스
public class _05_Tiger extends _05_Animal{
	@Override
	public void move() {
		System.out.println("호랑이가 네 발로 뜁니다.");
	}
	
	public void hunting() {
		System.out.println("호랑이가 사냥을 합니다.");
	}

}
