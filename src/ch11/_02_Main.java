package ch11;

// 2025.6.14	3교시

public class _02_Main {
	public static void main(String[] args) {
	
	
		Thread thread = new Thread(new _02_MyThread());		//_02_MyThread에서 Runnable을 구현하고 있기 때문에
															// 구냥 여기서 Thread를 하나 만들어버림
		thread.start();		// run() 호출
	
	
	/*
     * [면접]
     * Thread 생성과 실행
     *  
     * (2) Runnable 인터페이스를 구현하기
     * 1. Runnable 인터페이스를 implements 받아 클래스를 작성한다.
     * 2. 추상메서드 run()을 재정의(Override)한다.
     * 3. main() 메서드에서 Thread 객체를 생성하고, 이때 implements 받은 클래스객체를 매개변수로 전달한다.
     * 4. start() 메서드를 호출해서 스레드를 실행한다.
     * 5. run() 메서드가 실행된다.
     */
	}
}
