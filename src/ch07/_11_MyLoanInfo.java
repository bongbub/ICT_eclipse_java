package ch07;

//2025.6.5 (1교시 - 복습테스트)


// 자식클래스 - 부모클래스 상속받고 인터페이스 구현
public class _11_MyLoanInfo extends _11_LoanInfo implements _11_Loan{

	// 멤버변수
	private String borrower;		// 대출자 "홍길동"
	private String loanDate; 	// 대출일자 : 2024-4-26
	private int state;			// 대출여부 "STATE_REPAY = 0; // 상환상태

	
	// 생성자
	// 디폴트 생성자
	public _11_MyLoanInfo() {
		
	}
	
	// 매개변수 생성자
	public _11_MyLoanInfo(String loanNo, String productName, int state) {
	    super(loanNo, productName); // 부모의 생성자를 통해 loanNo, productName 설정
	    this.state = state;
	}
	public int getState() {
		return state;
	}
	
	// 인터페이스 추상메서드
	// 대출
	@Override
	public void loan(String loanNo, String productName, String borrower, String loanDate) {
		this.borrower = borrower;    //  --> loan()으로 받아온 값을 클래스 borrower에 저장
		this.loanDate = loanDate;	 //  --> loan()으로 받아온 값을 클래스 borrower에 저장
		this.setLoanno(loanNo);        // 부모 필드도 업데이트
		this.setProname(productName);  // 부모 필드도 업데이트
		if(state == STATE_REPAY) {		// implement로 받았으니까 _11_Loan.STATE_REPAY 로 접근하지않아도 됨
			System.out.println(" === 대출시 === ");
			System.out.println(" 대출되었습니다 ");
			System.out.println("도서번호 : "+loanNo);
			System.out.println("도서제목 : "+productName);
			System.out.println("대출인 : "+borrower);
			System.out.println("대출일 : "+loanDate);
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
			System.out.println("상환인 :"+ borrower);
			
			
			state = STATE_REPAY;
		}
		else {
			System.out.println("\n === 이미 상환된 상태인데 상환 시도 시 === ");
			System.out.println("대출중인 도서가 없습니다.");
		}
		
	}

}
