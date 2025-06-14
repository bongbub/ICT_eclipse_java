package ch11;

// 2025.6.14	3교시


// 2) Runnable 인터페이스를 구현하는 방법 - run() 메서드를 override
public class _02_MyThread implements Runnable{

	@Override
	public void run() {
		// 1부터 10까지 출력 예제
		for(int i = 1; i<=10; i++) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			finally {
				
			}
			System.out.println(i+ " 박자쉬고");
		}
	}
	
	
}
