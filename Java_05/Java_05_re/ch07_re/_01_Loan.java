package ch07_re;

// 2025.6.5 복습테스트

public interface _01_Loan {
	
	int STATE_LOAN = 1;		// 대출중임
	int STATE_REPAY = 0;	// 상환했음
	
	// 추상메서드
	public void loan();
	public void repay();

}
