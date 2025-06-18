package test;

//2025.6.4
//아침 테스트
// 1. 다형성이란
// 2. main메서드에서 매개변수에 다형성 적용해서 호출
//	메서드명 : callBank(다형성적용)
//	자식메서드까지 모두 호출

public class _00_KakaoBank extends _00_Bank {
	
	private String vipMem;		// vip

	public _00_KakaoBank(String bankname, String accountNumber, double rate, String vipMem){
		super(bankname, accountNumber, rate);
		this.vipMem = vipMem;
	}

	public String getVip(){
		return vipMem;
	}
	public void setVip(String vipMem){
		this.vipMem = vipMem;
	}
	
	public void makeKKO(){
		System.out.println("카카오 가입");
	}

	@Override
	public void printInfo(){
		System.out.println(" --- 카카오뱅크 ---");
		super.printInfo();
		System.out.println("등급 :"+vipMem);
	}

}
