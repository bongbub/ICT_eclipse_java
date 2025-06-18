package test;

import java.util.HashMap;


// 2025.6.14 	싱글톤 아침 테스트

public class _16_Bank {

	private String clientName;		// 고객명 	박나래	유느님
	private String bankName;		// 은행명	우리은행	신한은행
	private int balance;			// 잔고	10000	20000

	// 싱글톤 적용해서 클래스에 메서드로 접근
	// 디폴트생성자
	private static _16_Bank instance = new _16_Bank();	// instance == new _16_bank

	// getter setter
	public static _16_Bank getInstance() {
		if(instance == null) {
			instance = new _16_Bank();
		}
		return instance;
		// return clientName, bankName, balance;
	}
	
	private _16_Bank (){ }
	
	public void setInstance(String clientName, String bankName, int balance) {
		this.clientName = clientName;
		this.bankName = bankName;
		this.balance = balance;
	}
	// 메서드
	public void deposit(int money){
		if(money > 0) this.balance += money;	// 추가금이 0이상일 때만 입금
		System.out.println( "▣ "+money +"원을 입금했습니다. " + " \t▣ 잔액 : "+ balance); 
	}
	public void withdraw(int money) {
		if(money > 0) {
			if(balance > money) {
				balance -= money;
				System.out.println("▣ "+money + "원을 출금했습니다. " + "\t▣ 잔액 :"+balance);
			}
			else {
				System.out.println("▣ 잔액부족");
			}
		}
		
	}
	public void makeInterest() {
		int in = (int)(balance*0.02);
		balance += in;
		System.out.println("▣ 이자: "+in);
	}


	public String toString() {
		return "\n▣ 고객명 : " + clientName + "\t▣ 은행명 : "+ bankName + "\t▣ 잔액 : "+balance+ "\n";

	}
}
	
