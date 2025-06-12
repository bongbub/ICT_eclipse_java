package ch09_re;

import java.util.Scanner;

// 2025.6.11	복습

public class _02_ArithmethicException {
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		try {
			System.out.println("몫과 나머지를 계산할 두 수를 입력하시오.");
			System.out.print("첫 번째 수 : ");
			int num1 = scan.nextInt();
			System.out.print("두 번째 수 : ");
			int num2 = scan.nextInt();
			
			System.out.println("몫 :"+(num1/num2));
			System.out.println("나머지 : "+ num1%num2);
		}
		catch(ArithmeticException e) {
			System.out.println(e);
			System.out.println(e.getMessage());
		}
		finally {
			System.out.println("무조건 출력되는 finally 부분");
		}
		System.out.println("정상출력 테스트");
		scan.close();
		
	}
}
