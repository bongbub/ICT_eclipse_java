package test;

// 2025.6.4
// 아침 테스트
// 1. 다형성이란
// 2. main메서드에서 매개변수에 다형성 적용해서 호출
//	메서드명 : callBank(다형성적용)
//	자식메서드까지 모두 호출

public class _00_NHBank extends _00_Bank{
	
	private String event;	//금리인하
	
	public _00_NHBank(String bankname, String accountNumber, double rate, String event){
		super(bankname, accountNumber, rate);
		this.event = event;
	}


	public void executeLoan(){
		System.out.println("놈후옙흐넹");
	}

	public String getEvent(){
		return event;
	}
	public void setEvent(String event){
		this.event = event;
	}
	
	public void printInfo(){
		System.out.println(" --- 농협은행 ---");
		super.printInfo();
		System.out.println("Event :" + event);
	}


}
