package ch04;

import java.util.Scanner;

public class _01_CalMain {
	public static void main(String[] args) {

		// ctrl + shift + F : 소스코드 자동 정렬 굿^^

		double num1 = 8.0;
		double num2 = 4.0;
		_01_Calculator cal = new _01_Calculator();

		// 받아도 보장
		Scanner scan = new Scanner(System.in);

		double sum1 = cal.add(num1, num2);
		double sub1 = cal.sub(num1, num2);
		double mul1 = cal.mul(num1, num2);
		double div1 = cal.div(num1, num2);

		System.out.println(cal.add(num1, num2));
		System.out.println(cal.add(4.6, 7.2));
		System.out.println("두 수의 합 : " + sum1);
		System.out.println("두 수의 차 : " + sub1);
		System.out.println("두 수의 곱 : " + mul1);
		System.out.println("두 수의 나누기 : " + div1);
		System.out.println("-----------------------");

		System.out.print("사칙연산할 첫 번째 소수를 입력하시오. : ");
		double text1 = scan.nextDouble();
		System.out.print("사칙연산할 두 번째 소수를 입력하시오. : ");
		double text2 = scan.nextDouble();

		// 합
		double sumR = cal.add(text1, text2);
		// 차
		double subR = cal.sub(text1, text2);
		// 곱
		double mulR = cal.mul(text1, text2);
		// 나누기
		double divR = cal.div(text1, text2);

		System.out.println("두 수의 합 : " + sumR);
		System.out.println("두 수의 차 : " + subR);
		System.out.println("두 수의 곱 : " + mulR);
		System.out.println("두 수의 나누기 : " + divR);

		scan.close();
	}

}
