package ch11_re;

// 2025.6.14	복습

public class _02_MyThread implements Runnable{
	
	@Override
	public void run() {
		// 1부터 10까지 출력
		for(int i = 1; i<=10; i++) {
			System.out.println(i);
		}
	}
}
