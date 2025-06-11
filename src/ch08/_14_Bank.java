package ch08;

// 2025.6.11 아침 테스트

public class _14_Bank {

	// 멤버변수
	private int accountNo; // 계좌번호
	private String bankName; // 은행명
	private String depositor; // 예금주
	private int balance; // 잔고

	// 디폴트생성자
	public _14_Bank() {
	}

	// 매개변수 생성자
	public _14_Bank(int accountNo, String bankName, String depositor, int balance) {
		this.accountNo = accountNo;
		this.bankName = bankName;
		this.depositor = depositor;
		this.balance = balance;
	}

	// getter, setter
	public int getAcc() {
		return accountNo;
	}

	public void setAcc(int accountNo) {
		this.accountNo = accountNo;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getDepo() {
		return depositor;
	}

	public void setDepo(String depositor) {
		this.depositor = depositor;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	// toString()
	public String toString() {
		return accountNo + "\t" + bankName + "\t" + depositor + "\t" + balance;
	}
}
