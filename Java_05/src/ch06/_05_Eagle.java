package ch06;

//p268
//2025.6.2 (6교시)


//자식클래스
public class _05_Eagle extends _05_Animal{
	
	@Override
	public void move() {
		System.out.println("독수리가 하늘을 납니다.");
	}
	
	public void flying() {
		System.out.println("독수리가 날개를 펴고 하늘을 납니다.");
	}

}
