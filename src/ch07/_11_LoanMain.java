package ch07;

// 2025.6.5 (1교시 복습테스트)

public class _11_LoanMain {
	public static void main(String[] args) {
		
		// 인터페이스와 부모클래스를 상속한 자식 클래스

		// 부모클래스 상속
		_11_LoanInfo linfo = new _11_MyLoanInfo("P001","청년취업지원",_11_Loan.STATE_REPAY);
		
		
		if (linfo instanceof _11_MyLoanInfo) {
			_11_MyLoanInfo my = (_11_MyLoanInfo)linfo;
			my.loan(linfo.getLoanno(), "청년취업지원", "홍길동", "2024-04-27");
			
			// 두 번째 대출 시도
			my.loan("P001", "청년취업지원", "홍길동", "2024-04-27");
			
			// 대출 상환시
			my.repay();
			
			// 다시 상환 시도
			my.repay();
			
			
		}
		
	}
	
}
