package ch07;


// 2025.6.5 (1교시 - 복습테스트)

public interface _11_Loan {
	
	// 상수
	int STATE_LOAN = 1;		// 대출상태
	int STATE_REPAY = 0;	// 상환상태
	
	// 추상메서드
	public void loan(String loanNo, String productName, String borrower, String loanData);	// 대출하다
	public void repay();	// 상환하다


}
