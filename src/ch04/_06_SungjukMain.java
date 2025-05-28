package ch04;

import java.util.Scanner;

public class _06_SungjukMain {
	public static void main(String[] args) {
		
		_06_Sungjuk score = new _06_Sungjuk();


		score.setKor(90);
		score.setEng(80);
		score.setMath(70);

		score.printInfo();
		
		// 받아서도 측정
		
		System.out.println("");
		System.out.println("국어, 영어, 수학 점수 계산기");
		Scanner scan = new Scanner(System.in);


		System.out.print("국어 :");
		int sKor = scan.nextInt();
		System.out.print("영어 :");
		int sEng = scan.nextInt();
		System.out.print("수학 :");
		int sMath = scan.nextInt();


		score.setKor(sKor);
		score.setEng(sEng);
		score.setMath(sMath);
		
		System.out.println("===== 결과 =====");
		score.printInfo();
		
		scan.close();

	}

}
