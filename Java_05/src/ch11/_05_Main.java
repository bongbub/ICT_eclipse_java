package ch11;


// 2025.6.14	4교시

public class _05_Main {
	public static void main(String[] args) {
		
		// 객체 5개, 스레드 5개
		// 각자 영향을 받지 않고, 각자 일을 한다
		
		Thread local1 = new Thread(new _05_VoteThread(), "서울");
		Thread local2 = new Thread(new _05_VoteThread(), "광주");
		Thread local3 = new Thread(new _05_VoteThread(), "부산");
		Thread local4 = new Thread(new _05_VoteThread(), "제주도");
		Thread local5 = new Thread(new _05_VoteThread(), "인천");
		
		local1.start();
		local2.start();
		local3.start();
		local4.start();
		local5.start();
		
	}
}
