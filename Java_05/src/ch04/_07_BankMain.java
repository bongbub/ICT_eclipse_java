package ch04;

import java.util.Scanner;

public class _07_BankMain {
	
	public static void main(String[] args){
		
		// 2025.05.29
		
		
		// 방법1. 디폴트 생성자 + setter로 값 전달
		_07_Bank bk = new _07_Bank();

		bk.setBankName("우리은행");
		bk.setDepositor("김길동");
		bk.setBalance(1000000);

		bk.printInfo();
		System.out.println("");

		// 방법2. 매개변수 생성자로 값 전달
		_07_Bank bk2 = new _07_Bank("국민은행", "홍길동이~", 4000000);

		bk2.printInfo();
		System.out.println("");


		// 값을 받아서 해보깅
		Scanner sc = new Scanner(System.in);

		System.out.print("은행명 :");
		String sbname = sc.next();
		System.out.print("예금주 :");
		String sdepo = sc.next();
		System.out.print("잔고 :");
		int sbal = sc.nextInt();

		
		bk2.setBankName(sbname);
		bk2.setDepositor(sdepo);
		bk2.setBalance(sbal);

		bk2.printInfo();
		sc.close();
	}
		


}
