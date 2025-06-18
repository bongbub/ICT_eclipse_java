package test;

//2025.6.4
//아침 테스트
//1. 다형성이란
//2. main메서드에서 매개변수에 다형성 적용해서 호출
//	메서드명 : callBank(다형성적용)
//	자식메서드까지 모두 호출


public class _00_BankMain {

	public static void main(String[] args){
		
		_00_Bank nh = new _00_NHBank("농협은행", "0001", 1.3, "금리인하");
		//bk.printInfo();
		callBank(nh);
		
		callBank(new _00_KakaoBank("카카오뱅크","9239",1.4, "카카오가입"));
		
		
	}
	
	
	public static void callBank(_00_Bank bank) {
		bank.printInfo();
		
		if(bank instanceof _00_NHBank) {
			// 자식클래스인 NHBank의 executeLoan에 접근하기 위해 다운캐스팅
			_00_NHBank nh = (_00_NHBank) bank; 
			nh.executeLoan();
		}
		else if(bank instanceof _00_KakaoBank) {
			_00_KakaoBank kk = (_00_KakaoBank) bank;
			kk.makeKKO();
			
		}
	}
}
