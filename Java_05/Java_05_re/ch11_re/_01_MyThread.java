package ch11_re;

// 2025.6.14	복습

public class _01_MyThread extends Thread{
	
	// 1부터 10까지 출력 예제
	@Override
	public void run() {
		for(int i = 1; i<=10; i++) {
			
			// 시간 주기
			try {
				Thread.sleep(1000);
			}catch(InterruptedException e) {
				e.printStackTrace();
			}finally {}
			System.out.println(i);
		}
	}

}
