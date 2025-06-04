package ch07;

// 2025.6.4 (7교시)
// 다중상속과 구현

public class _05_Main {
	public static void main(String[] args) {
		
		
		System.out.println("<< 방법1) 다형성 적용 - 부모는 인터페이스 >>");
		System.out.println(" -- 부모인터페이스 : _05_Mobile 타입 --");
		_05_Mobile mobile = new _05_SmartPhone();
		mobile.sendSMS();
		mobile.receieSMS();
		// mp3 기능을 사용하려면 다운캐스팅하여 다시 접근
		// 다운캐스팅 방법 1)
		if(mobile instanceof _05_SmartPhone) {
			_05_SmartPhone sp = (_05_SmartPhone)mobile; // 다운캐스팅
			sp.stop();
			sp.play();
			System.out.println("cal :"+ sp.calculate(1, 1));
		}
		System.out.println("======================");
		
	
		System.out.println(" -- 부모인터페이스 : _05_Mp3 타입 --");
		_05_Mp3 mp3 = new _05_SmartPhone();
		mp3.play();
		mp3.stop();
		// mobile 기능을 사용하려면 다운캐스팅하여 다시 접근
		// 다운캐스팅 방법 2)
		if(mp3 instanceof _05_SmartPhone) {
			((_05_SmartPhone) mp3).sendSMS();	// 변수 할당 없는 임시 다운캐스팅
			((_05_SmartPhone)mp3).receieSMS();
			System.out.println("cal :"+((_05_SmartPhone)mp3).calculate(4, 4));
		}
		System.out.println("======================");
	
		
		System.out.println("<< 방법2) 다형성 적용 - 부모는 클래스 >>");
		_05_PDA pda = new _05_SmartPhone();
		System.out.println(pda.calculate(3, 2));
		if(pda instanceof _05_SmartPhone) {
			_05_SmartPhone sm = (_05_SmartPhone)pda;
			sm.sendSMS();
			sm.receieSMS();
			sm.play();
			sm.stop();
		}
		System.out.println("======================");
		
		
	}

}
