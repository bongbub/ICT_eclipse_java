package ch11;


// 2025.6.14	3교시


// 멀티스레드
//2) Runnable 인터페이스를 구현하는 방법 - run() 메서드를 override
public class _03_MyRunnable implements Runnable{
	
	// 멤버변수
	private String threadName;		// ThreadA	ThreadB

	
	
	// 디폴트생성자
	public _03_MyRunnable() {}
	
	// 매개변수생성자
	public _03_MyRunnable(String threadName) {
		this.threadName = threadName;
	}
	
	
	
	// Runnable 내의 run() 구현(오버라이드)
	@Override
	public void run() {
		System.out.println();
		for (int i = 10; i>= 1; i--) {
			System.out.print(threadName + " - " + i +" \n");
//			if((i / 5) == 0) {
//				System.out.println("");
//			}
		}
		
	}
}
