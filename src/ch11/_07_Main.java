package ch11;

// 2025.6.14	7교시

public class _07_Main {
	public static void main(String[] args) throws InterruptedException {
		
//		1) 한 계좌의 금액을 다른 계좌로 이체
//		2) 공유영역 (김태희계좌(200만원) + 비계좌(100만원))
//		3) 두 계좌의 잔액합계를 출력하는 일을 동시에 한다.
		
		
		
		// 매개변수생성자 호출
		_07_Account kim = new _07_Account("010-1212-3434", "김태희", 2000000);
		_07_Account b = new _07_Account("010-8888-5556", "비", 1000000);
		
		_07_SharedArea s = new _07_SharedArea(kim,b);
		
		// 스레드 발생
		_07_TransferThread th1 = (new _07_TransferThread(s));
		_07_TotalBalanceThread th2 =(new _07_TotalBalanceThread(s));
		
		
		
		// 스레드실행
		th1.start();
		Thread.sleep(1000);
		th2.start();
//		th1.join();
//		th2.join();
//		
		
		
	}
}
