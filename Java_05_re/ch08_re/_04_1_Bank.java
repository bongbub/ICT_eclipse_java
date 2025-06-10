package ch08_re;

public class _04_1_Bank {
	
	// 멤버변수
	private int money;
	private String bankname;
	
	// 매개변수 생성자
	public _04_1_Bank(int money, String bankname) {
		this.bankname = bankname;
		this.money = money;
	}
	
	
	// getter setter
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	
	// toString()
	@Override
	public String toString() {
		return bankname +"에 들어있는 돈은 "+money+"원 입니다.";
	}

}
