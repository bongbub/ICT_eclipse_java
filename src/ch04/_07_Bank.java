package ch04;

public class _07_Bank {
	
	// 2025.05.29
	
	// 멤버변수
	String bankname;     // 은행명 - 우리은행
	String depositor;      // 예금주 - 본인
	int balance;            // 잔고 - 1000000    4000000

	// 디폴트 생성자
	public _07_Bank() {}
	
	// 매개변수 생성자
	public _07_Bank(String bname, String depo, int bal){
		bankname = bname;
		depositor = depo;
		balance = bal;
	}

	// 멤버메서드(getter setter)
	public String getBankName(){
		return bankname;
	}
	public void setBankName(String bname){
		bankname = bname;
	}
	public String getDepositor(){
		return depositor;
	}
	public void setDepositor(String depo){
		depositor = depo;
	}
	public int getBalance(){
		return balance;
	}
	public void setBalance(int bal){
		balance = bal;
	}

	//멤버메서드(printInfo)
	public void printInfo(){
		System.out.println("은행명 :" + bankname);
		System.out.println("예금주 :" + depositor);
		System.out.println("잔고 :"+balance);

}

}
