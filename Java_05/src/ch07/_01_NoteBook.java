package ch07;


//2025.6.4 (4교시)
//추상클래스


public abstract class _01_NoteBook extends _01_Computer{

	@Override
	public void display() {
		System.out.println("안녕하세용~~~?(⠀  ᐢ ᵕ ᐢ  )⸝‍⸜(  ᐢ ᵕ ᐢ    )⸝‍");
		
	}

	
	// typing()은 자식에게 위임(자식메서드에서 구현하겠다)
	// 때문에 _01_NoteBook 클래스도 추상클래스가 됨
	// (부모의 모든 추상메서드를 구현하지 않았기 때문에)
}
