package ch07;

//2025.6.4 (3교시 개배고프다)
//추상클래스



public class _01_Main {
	public static void main(String[] args) {
		
		// 힙메모리에 올라가는 클래스는 자식 클래스
		// 왜냐면 부모클에 있는 추상메서드(구현안됨)은 올라가면 안됨 (사실상 문법오류와 같음)
		// 때문에 메서드를 구현해놓은 자식클래스를 new 해줘야 함 (완전한 클래스)
		//_01_Computer com = new _01_Computer();  // 오류.
		
		// 자식클래스 객체 생성
		// _01_DeskTop desktop = new _01_DeskTop();
		// 다형성 적용 : 부모클래스 참조변수 = new 자식클래스();
		_01_Computer desktop = new _01_DeskTop();
		
		desktop.turnOn();
		desktop.turnOff();
		desktop.display();	// 재정의 된 자식메서드가 호출됨(new에 의해 힙메모리에 올라간건 자식클래스이기 때문에)
		desktop.typing();
		
		System.out.println("====================");
		
		_01_Computer note = new _01_MyNoteBook();
		note.turnOn();
		note.turnOff();
		note.display();
		note.typing();
		
	}
}
