package ch07;


// 2025.6.4 (3교시 개배고프다)
// 추상클래스

// 자식클래스
public class _01_DeskTop extends _01_Computer{

	@Override
	public void display() {
		System.out.println("_01_DeskTop - display()");
		
	}

	@Override
	public void typing() {
		System.out.println("_01_DeskTop - typing()");
		
	}
	
}
