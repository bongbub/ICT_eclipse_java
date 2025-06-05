package ch07;

// 2025.6.5 (1교시 복습테스트)

public class _11_2_LoanMain {
	public static void main(String[] args) {

		// 인터페이스와 부모클래스를 상속한 자식 클래스

		// 부모클래스 상속
		_11_2_LoanInfo linfo = new _11_2_MyLoanInfo("신한은행", "321-546828-48251", "P001", "청년취업지원", "홍길동", "2025-06-05",
				_11_2_Loan.STATE_REPAY);

		if (linfo instanceof _11_2_MyLoanInfo) {
			_11_2_MyLoanInfo my = (_11_2_MyLoanInfo) linfo;

			my.loan();

			// 두 번째 대출 시도
			my.loan();

			// 대출 상환시
			my.repay();

			// 다시 상환 시도
			my.repay();

		}

	}

}
