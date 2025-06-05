package ch04_re;

import java.util.Scanner;

public class _01_CalMain {
	public static void main(String[] args) {
		
		
		// 직접 하드코딩
		double num1 = 9.2;
		double num2 = 1.4;
		
		// 생성자 
		_01_Calculator cal = new _01_Calculator();
		
		// 직접 하드코딩2
		double selfsum = cal.add(num1, num2);
		double selfsub = cal.sub(num1, num2);
		double selfmul = cal.mul(num1, num2);
		double selfdiv = cal.div(num1, num2);
		
		System.out.println("9.2, 1.4 하드코딩 결과");
		System.out.println("덧셈 : "+selfsum);
		System.out.println("뺄셈 : "+selfsub);
		System.out.println("곱셈 : "+selfmul);
		System.out.println("나눗셈 : "+selfdiv);
		System.out.println("");
		
		
		// 직접 받아보기
		Scanner scan = new Scanner(System.in);
		
		System.out.print("첫 번째 입력 수 :");
		double text1 = scan.nextDouble();
		System.out.print("두 번째 입력 수 :");
		double text2 = scan.nextDouble();
		
		double sum = cal.add(text1, text2);
		double sub = cal.sub(text1, text2);
		double mul = cal.mul(text1, text2);
		double div = cal.div(text1, text2);
		
		System.out.println("입력한 수의 사칙연산 결과입니다.");
		System.out.println("덧셈 : "+sum);
		System.out.println("뺄셈 : "+sub);
		System.out.println("곱셈 : "+mul);
		System.out.println("나눗셈 : "+div);
		
		
		scan.close();
	}

}
