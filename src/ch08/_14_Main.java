package ch08;

// 2025.6.11 아침 테스트

public class _14_Main {
	public static void main(String[] args) {
		
		
		// 매개변수 생성자로 값 전달
		_14_Bank woo = new _14_Bank(222, "우리은행", "김훈", 16000);
		_14_Bank koo  = new _14_Bank(333, "국민은행", "김승호", 16020);
		_14_Bank ki = new _14_Bank(444, "기업은행", "김영하", 10000);
		_14_Bank san = new _14_Bank(555, "산업은행", "양귀자", 11700);

		_14_BankHashMap bh = new _14_BankHashMap();
		
		// bank 추가 후 출력
		bh.insertBank(woo);
		bh.insertBank(koo);
		bh.insertBank(ki);
		bh.insertBank(san);

		System.out.println("--- 은행 및 예금주 정보 ---");
		bh.queryBank();

		// 444번 삭제 후 출력
		System.out.println("--- 444 삭제 후 출력 ---");
		bh.deleteBank(444);
		bh.queryBank();

	}

}
