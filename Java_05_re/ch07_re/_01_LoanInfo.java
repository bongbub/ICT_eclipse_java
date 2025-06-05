package ch07_re;

// 2025.6.5

public class _01_LoanInfo {
	
	// 멤버변수
	private String bankname;
	private String accnum;
	private String loanNo;
	private String productName;
	
	// 디폴트 생성자
	public _01_LoanInfo() {
		
	}
	
	
	// 매개변수 생성자
	public _01_LoanInfo(String bankname, 
			String accnum, String loanNo, String productName) {
		this.bankname = bankname;
		this.accnum = accnum;
		this.loanNo = loanNo;
		this.productName = productName;
	}
	
	// 멤버메서드
	public String getBname() {
		return bankname;
	}
	public void setBname(String bankname) {
		this.bankname = bankname;
	}
	
	public String getAnum() {
		return accnum;
	}
	public void setAnum(String accnum) {
		this.accnum = accnum;
	}
	
	public String getLoanNo() {
		return loanNo;
	}
	public void setLoanNo(String loanNo) {
		this.loanNo = loanNo;
	}
	
	public String getProname() {
		return productName;
	}
	public void setProname(String productName) {
		this.productName = productName;
	}
	
	

}
