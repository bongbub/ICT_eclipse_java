package ch11;

// 2025.6.14	7교시

// 3-2) 잔액합계 스레드 - Thread 클래스를 상속받음
public class _07_TotalBalanceThread extends Thread{
	
	_07_SharedArea sa;
	
	// 디폴트생성자
	_07_TotalBalanceThread () {}
	
	// 매개변수생성자
	_07_TotalBalanceThread (_07_SharedArea sa){
		this.sa = sa;
	}
	
	// run() 재정의 -> getBalanceTotal() 3번 호출(for문)해서 잔액합계 출력 , 1초 간격
	@Override
	public void run() {
		for(int cnt = 0; cnt<3; cnt++) {
			int sum = sa.getBalanceTotal();
			System.out.println( "계좌잔액합계 : "+sum);
		}
		
	}
}
