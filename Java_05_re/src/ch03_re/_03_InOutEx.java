package src.ch03_re;

import java.util.Scanner;

public class _03_InOutEx {
	
	public static void main(String[] args) {
		
		// 두 수의 합을 구하깅
		// 클래스명 참조변수 = new 클래스명();
		
		System.out.println("합을 구할 두 수를 입력하세요");
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("첫 번째 수 :");
		int num1 = scan.nextInt();
		
		System.out.print("두 번째 수 :");
		int num2 = scan.nextInt();
		
		int sum = num1 + num2;
		
		System.out.println("합 : "+ sum);
	
		scan.close();
	}
	
}
