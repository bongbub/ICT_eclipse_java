package ch11;

// 2025.6.14	7교시


// 3-1. 계좌이체 스레드 - Thread 클래스 상속
public class _07_TransferThread extends Thread{

	
	// 멤버변수
	_07_SharedArea sa;		// 매개변수생성자를 통해 주소값 전달
	
	// 디폴트생성자
	_07_TransferThread () {}
	
	// 매개변수생성자
	_07_TransferThread(_07_SharedArea sa){
		this.sa = sa;
	}
	
	// run() 재정의 -> 계좌이체 transfer(1000) 5번 호출(for문)
	@Override
	public void run() {
		
		for(int i = 0; i<5; i++) {
			System.out.println("계좌이체 5회 :" );
			sa.transfer(1000);
		}
	}
	
	
	
}
