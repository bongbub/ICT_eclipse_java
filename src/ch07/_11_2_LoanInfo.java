package ch07;

//2025.6.5 (1교시 - 복습)


// 부모클래스
public class _11_2_LoanInfo {
	// 멤버변수
	private String bankname; 		// 은행명
	private String accnum;			// 계좌번호
	private String loanNo;			// 대출번호
	private String productName;		// 대출상품명 " 청년 취업 지원 "

	// 디폴트 생성자
	public _11_2_LoanInfo() {
		
	}
	
	// 매개변수생성자
	public _11_2_LoanInfo(String bankname, String accnum, String loanNo, String productName) {
		this.bankname = bankname;
		this.accnum = accnum;
		this.loanNo = loanNo;
		this.productName = productName;
	}
	
	// 멤버메서드
	public String getLoanno() {
		return loanNo;
	}
	public void setLoanno(String laonNo) {
		this.loanNo = laonNo;
	}
	public String getProname() {
		return productName;
	}
	public void setProname(String productName) {
		this.productName = productName;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getAccnum() {
		return accnum;
	}
	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}
	

}
