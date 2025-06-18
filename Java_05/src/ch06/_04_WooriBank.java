package ch06;

// 2025.6.2

public class _04_WooriBank extends _04_Bank{
	
	
	// 방법2)
	// 자식 매개변수 생성자로 값 전달
	
	private String vipMember;		// vip
	
	public _04_WooriBank(String bankname, String accountNumber, double rate, String vipMember) {
		super(bankname, accountNumber, rate);
		this.vipMember = vipMember;
	}
	
	public void makeWooriProduct() {
		System.out.println("이율 높은 상품 출시!");
	}
	
	// 부모메서드 오버라이드
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("등급 : "+vipMember);
	}
	
	

}
