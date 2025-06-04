package src.ch03_re;

import java.util.Scanner;

public class _04_InOutEx {
	
	public static void main(String[] args) {
		
		
		// 스캐너를 이용해서 값 가져오기
		
		// 클래스명 참조변수 = new 클래스명();
		// java에서 제공하는 입력함수
		
		System.out.println("===== My Info =====");
		Scanner scan = new Scanner(System.in);
		
		
		System.out.print("이름을 입력하세요 :");
		String name = scan.next();
		
		System.out.print("나이를 입력하세요 :");
		int age = scan.nextInt();
		
		System.out.println("이메일을 입력하세요 :");
		String email = scan.next();
		
		System.out.println("이름 : "+ name);
		System.out.println("나이 : "+ age);
		System.out.println("이메일 : "+ email);
		
		scan.close();
	}

}
