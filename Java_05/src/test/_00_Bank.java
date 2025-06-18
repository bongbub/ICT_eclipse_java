package test;

	// 2025.6.4
	// 아침 테스트
	// 1. 다형성이란
	// 2. main메서드에서 매개변수에 다형성 적용해서 호출
	//	메서드명 : callBank(다형성적용)
	//	자식메서드까지 모두 호출

public class _00_Bank {

	// 부모클래스
		private String bankname;	// 은행명
		private String accountNumber;	// 계좌번호
		private double rate;	// 이율
		
		public _00_Bank(String bankname, String accountNumber, double rate) {
			this.accountNumber = accountNumber;
			this.bankname = bankname;
			this.rate = rate;
		}

		public String getBankname(){
			return bankname;
		}
		public void setBankname(String bankname){
			this.bankname = bankname;
		}
		public String getAccNum(){
			return accountNumber;
		}
		public void setAccNum(String accountNumber){
			this.accountNumber = accountNumber;
		}
		public double getRate(){
			return rate;
		}
		public void setRate(double rate){
			this.rate = rate;
		}

		public void printInfo(){
			System.out.println("은행명 :" + bankname);
			System.out.println("계좌번호 :" + accountNumber);
			System.out.println("이율 :" + rate);
		}
}
