package ch11;

// 2025.6.14	5교시

// 1. 계좌정보 클래스
public class _07_Account {
	
	private String accountNo;		// 계좌번호	010-1111-2222		010-8888-3333
	private String ownerName;		// 예금주명	김태희				비
	private int balance;			// 잔액		2000000				1000000
	
	// 	디폴트생성자
	_07_Account (){}
	
	// 매개변수 생성자
	_07_Account(String accountNo, String ownerName, int balance){
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
	
	// 멤버메서드 (getter, setter)
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accoutNo) {
		this.accountNo = accoutNo;
	}
	public String getOwner() {
		return ownerName;
	}
	public void setOwner(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	// 출금하다
	public int withdraw(int amount) {
		if(balance < amount) return 0;
		else {
			balance -= amount;
			System.out.println(ownerName + "계좌 : "+ amount +"원 출금되었습니다.");
			System.out.println("잔액 : "+balance);
		
		}return balance;		
		// balance가 아니라 amount를 반환하는 이유
		// amount -> 실제 출금된 금액이자 출금이 완료되었다는 증거
		// 때문에 다시 deposit으로 들어감
		// 여기에 balance를 주게 되면 -> 199000이 반환됨
		// 다시 deposit(199000)이 실행됨
	}
	// 입금하다
	public void deposit(int amount) {
		// balance 구하기
		if(amount < 0) {
			System.out.println(" 0원 이상 입금할 수 있습니다.");
		}
		else {
			balance += amount;
			System.out.println(ownerName + "계좌 : "+ amount+"원을 입금합니다.");
			System.out.println("잔액 : "+balance +"\n");
		}
	}
}
