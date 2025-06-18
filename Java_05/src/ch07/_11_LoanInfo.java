package ch07;

//2025.6.5 (1교시 - 복습)


// 부모클래스
public class _11_LoanInfo {
	// 멤버변수
	private String loanNo;			// 대출번호
	private String productName;		// 대출상품명 " 청년 취업 지원 "

	// 디폴트 생성자
	public _11_LoanInfo() {
		
	}
	
	// 매개변수생성자
	public _11_LoanInfo(String loanNo, String productName) {
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
	

}
