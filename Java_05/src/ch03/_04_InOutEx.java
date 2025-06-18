package ch03;

import java.util.Scanner;

public class _04_InOutEx {
	public static void main(String[] args) {
		
		// 스캐너를 이용해서 값 가져오기
		
		// 클래스명 참조변수 = new 클래스명();
		// java에서 제공하는 입력함수
		// 자바API => https://docs.oracle.com/javase/8/docs/api
		
		
		// 콘솔창에 이름, 나이, 이메일을 입력받아 출력하기
		
		System.out.println("==== My Infomation ====");
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름을 입력하세요. : ");
		String name = scan.next();
		System.out.print("나이를 입력하세요. :");
		String age = scan.next();
		System.out.println("이메일을 입력하세요. :");
		String email = scan.next();
		
		System.out.println(
				"이름 : "+ name);
		System.out.println("나이 : " + age);
		System.out.println("이메일 : " + email);
		System.out.println(
				name+"씨의 나이는 "+age+"세 이고, 이메일은 "+email+"입니다.");
		
		scan.close();
	}

}
