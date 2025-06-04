package src.ch04_re;

import java.util.Scanner;

public class _06_SungjukMain {
	
	public static void main(String[] args) {
		
		
		_06_Sungjuk sg1 = new _06_Sungjuk();
		
		sg1.setKor(90);
		sg1.setEng(80);
		sg1.setMath(100);
		
		sg1.printInfo();
		
		System.out.println(" 직접 입력받아 출력");
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print(" 국어 : ");
		int skor = scan.nextInt();
		System.out.print(" 영어 : ");
		int seng = scan.nextInt();
		System.out.print(" 수학 : ");
		int smath = scan.nextInt();
		
		_06_Sungjuk sg2 = new _06_Sungjuk(skor, seng, smath);
		sg2.printInfo();
		
		scan.close();
	}

}
