package ch07_re;


// 2025. 6. 5

// 자식클래스 - 부모클래스 상속받으며 인터페이스 구현
public class _01_MyLoanInfo extends _01_LoanInfo implements _01_Loan{

	
	// 멤버변수
	private String bor;		// 대출자 ; 홍길동
	private String loanDate; // 대출일 2025-06-05
	private int state;		// 상환상태
	
	// 생성자
	// 디폴트생성자
	public _01_MyLoanInfo() {
		
	}
	// 매개변수 생성자
	// 부모매개변수도 가져옴
	public _01_MyLoanInfo(
			String bankname, String accnum,
			String loanNo, String productName, 
			String bor, String loanDate, int state) {
		super(bankname, accnum, loanNo, productName);
		this.bor = bor;
		this.loanDate =loanDate;
		this.state=state;
	}
	
	// 인터페이스 추상메서드 구현
	@Override
	public void loan() {
		// 대출 STATE_LOAN=1(대출상태)
		if(state==STATE_LOAN) {
			System.out.println("이미 대출중이므로 대출할 수 없습니다.");
			System.out.println("먼저 상환완료 해주십시오.\n");
		}
		else {
			System.out.println("은행명 :"+super.getBname());
			System.out.println("계좌번호 : "+super.getAnum());
			System.out.println("대출번호 : "+super.getLoanNo());
			System.out.println("대출상품 : "+super.getProname());
			System.out.println("대출인 : "+ this.bor);
			System.out.println("대출일 : "+this.loanDate);
			System.out.println("대출 완료 되었습니다.\n");
			state=STATE_REPAY;
		}
		
	}

	@Override
	public void repay() {
		if(state == STATE_REPAY) {
			System.out.println("이미 상환완료되었으므로 상환할 수 없습니다.");
			System.out.println("먼저 대출 해주십시오.\n");
		}
		else {
			System.out.println("은행명 :"+super.getBname());
			System.out.println("계좌번호 : "+super.getAnum());
			System.out.println("대출번호 : "+super.getLoanNo());
			System.out.println("대출상품 : "+super.getProname());
			System.out.println("대출인 : "+ this.bor);
			System.out.println("대출일 : "+this.loanDate);
			System.out.println("상환 완료 되었습니다.\n");
			state=STATE_LOAN;
		}
	}

}
