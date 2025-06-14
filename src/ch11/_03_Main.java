package ch11;

// 2025.6.14	3교시

public class _03_Main {
	public static void main(String[] args) {
		
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
		
		
		Thread threadA = new Thread(new _03_MyRunnable("ThreadA"));
		Thread threadB = new Thread(new _03_MyRunnable("ThreadB"));
		
		threadA.start();
		threadB.start();
		
	}

}
