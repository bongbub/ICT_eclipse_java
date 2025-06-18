package ch07;

//2025.6.5 (1교시 - 복습테스트)


// 자식클래스 - 부모클래스 상속받고 인터페이스 구현
public class _11_2_MyLoanInfo extends _11_2_LoanInfo implements _11_2_Loan{

	// 멤버변수
	private String borrower;		// 대출자 "홍길동"
	private String loanDate; 	// 대출일자 : 2024-4-26
	private int state;			// 대출여부 "STATE_REPAY = 0; // 상환상태

	
	// 생성자
	// 디폴트 생성자
	public _11_2_MyLoanInfo() {
		
	}
	
	// 매개변수 생성자
	public _11_2_MyLoanInfo(String bankname, String accnum,String loanNo, String productName, String borrower, String loanDate, int state) {
	    super(bankname, accnum, loanNo, productName); // 부모의 생성자를 통해 loanNo, productName 설정
	    this.state = state;
	    this.borrower = borrower;
	    this.loanDate = loanDate;
	}

	
	// 인터페이스 추상메서드
	// 대출
	@Override
	public void loan(){
		
		if(state == STATE_REPAY) {		// implement로 받았으니까 _11_Loan.STATE_REPAY 로 접근하지않아도 됨
			System.out.println(" === 대출시 === ");
			System.out.println(" 대출되었습니다 ");
			System.out.println("은행명 : "+super.getBankname());
			System.out.println("계좌번호 : "+super.getAccnum());
			System.out.println("대출번호 : "+super.getLoanno());
			System.out.println("대출상품 : "+super.getProname());
			System.out.println("대출인 : "+ this.borrower );
			System.out.println("대출일 : "+this.loanDate);
			state = STATE_LOAN;
			
		}
		else {
			System.out.println("\n === 이미 대출된 상태인데 대출 시도 시 ===");
			System.out.println("대출 중에는 중복 대출할 수 없습니다.");
		}

	}

	@Override
	public void repay() {
		if(state == STATE_LOAN) {
			System.out.println("\n === 상환 시 === ");
			System.out.println("상환되었습니다.");
			System.out.println("은행명 : "+super.getBankname());
			System.out.println("계좌번호 : "+super.getAccnum());
			System.out.println("대출번호 : "+super.getLoanno());
			System.out.println("상환인 :"+ this.borrower);
			System.out.println("대출상품 : "+super.getProname());
			System.out.println("대출일 : "+this.loanDate);
			System.out.println();
			
			
			state = STATE_REPAY;
		}
		else {
			System.out.println("\n === 이미 상환된 상태인데 상환 시도 시 === ");
			System.out.println("이미 상환된 상태입니다.");
		}
		
	}


}
