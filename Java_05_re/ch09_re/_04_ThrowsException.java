package ch09_re;

import java.util.Scanner;

// 2025.6.12.	복습

public class _04_ThrowsException {
	
	// 나이를 받아서 0이하로 입력되면 강제예외 발생
	static Scanner scan = new Scanner(System.in);
	
	
	public static void main(String[] args) {
		
		try {
			int text = readAge();
			System.out.println("나이 :"+text);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			
		}
		System.out.println("------안전종료------");
		
	}
	
	public static int readAge() throws Exception {
		
		System.out.print("나이를 입력하시오 :");
		int age = scan.nextInt();
		if(age<0) {
			throw new Exception("나이는 0이상의 수를 입력해야합니다.");
		}
		return age;
	}
	
	// static 인 main()에서 readAge()를 호출하고 싶으니까
	// readAge()도 static으로 만들어줌
	// 따라서 readAge() 내에 있는 scan도 static이 되어ㅑㅇ함
	
}
