package ch03;

import java.util.Scanner;

public class _03_InOutEx {
	
	public static void main(String[] args) {
		
		// 두 수의 합을 구하기
		// 클래스명 참조변수 = new 클래스명();
		
		// java에서 제공하는 입력함수
		// 자바API => https://docs.oracle.com/javase/8/docs/api
		
		System.out.println("합을 구할 두 개의 수를 입력하세요.");
		
		// 콘솔에서 직접 입력받는 클래스
		Scanner scan = new Scanner(System.in);
		
		System.out.print("첫 번째 수 :");
		int num1 = scan.nextInt();
		System.out.print("두 번째 수 :");
		int num2 = scan.nextInt();
		int sum = num1 + num2;
		
		System.out.println(num1 +" + "+ num2 + " = " + sum);
		
		scan.close();
	}

}
