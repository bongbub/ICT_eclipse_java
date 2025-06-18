package ch11;

// 2025.6.14	5교시


// 2. 공유영역 - 계좌이체, 잔액합계
public class _07_SharedArea {
	
	_07_Account kimAccount;		// 김태희 계좌
	_07_Account bAccount;		// 비 계좌
	
	// 디폴트 생성자
	_07_SharedArea () {}
	
	// 매개변수 생성자	// 주소값 전달
	_07_SharedArea(_07_Account kimAccount, _07_Account bAccount){
		this.kimAccount = kimAccount;
		this.bAccount = bAccount;
	}
	
	
	/*  <<<<< p606 >>>>>>
	 * 임계영역(=공유자원)  =>> 스레드가 동시에 접근하려는 공통메모리와 같은 자원
	 * 				 		여러 스레드가 공유자원을 동시에 처리하면 예기치 않은 오류가 발생한다			
	 * 						
	 * 
	 * 동기화 (synchronized)
	 * 					- 멀티스레딩 상황에서 여러개의 스레드가 공유자원에 동시에 접근할 때,
	 * 						하나의 스레드만 접근하도록 하고 나머지 접근을 막아(lock 처리)
	 * 						순차적으로 접근할 수 있도록 한다.
	 * 
	*[synchronized] - 동기화 .. 문서출력
    *   예)A,B,C 출력순서는 달라질수는 있으나(시분할), 문서는 섞이면 안된다.
    *   
    * 동기화란 공유된 자원중에서 동시에 사용하면 안되는 자원에 대해 잠금(lock)을 수행하여 보호하는 도구이다.
    * 즉 메서드를 호출할 때 객체에 잠금을 하고, 메서드 수행이 끝나면 잠금을 해제한다.
    * 
    * 
    * 
    * [임계 영역(critical section)]
    * - 한 사용자가 자원을 사용하고 있으면, 다른 사용자는 사용이 끝날때까지 기다려야 한다.
    *   이러한 영역을 임계영역이라고 한다.
    *   
    * - 동기화 메서드를 만들기 위해서는   synchronized 키워드를 메서드 선언에 붙이면 된다.
    * - synchronized 키워드를 사용하면, 어떠한 순간에는 하나의 스레드만이 임계영역 안에서 실행하는 것이 보장된다.
    * - synchronized 키워드가 붙어있으면, 하나의 스레드가 공유메서드를 실행하는 동안에, 다른 스레드는 공유메서드를 실행할 수 없다.
    * 
    * - wait() 메서드는 어떤 일이 일어나기를 기다릴 때 사용하는 메서드이다.
    * - notify() 메서드는 반대로 어떤 일이 일어났을 때 이를 알려주는 메서드이다.
    * 
    * <임계 영역(critical section)의 동기화>
    * - critical section이 문제를 일으키지 않으려면 그 부분이 실행되는 동안
    *   다른 스레드가 공유 데이터를 사용할 수 없도록 만드는 것을 말한다.
    * 
    * 
	*/
	
	// 계좌이체를 하다 (3-1. 스레드에서 호풀(_07_TransferThread)
	synchronized void transfer(int amount) {
		// 출금하다 withdraw() 호출 후 출력
		kimAccount.withdraw(amount);
		
		// 입금하다 deposit() 호출 후 출력
		bAccount.deposit(amount);
		System.out.println();
	}
	
	// 잔액합계를 구하다 (3-2 스레드에서 호출 예정 (_07_TotalBalanceThread))
	int getBalanceTotal() {
		int sum = (kimAccount.getBalance() + bAccount.getBalance());
		return sum;			// 각 잔액 합계
	}
	
	

}
