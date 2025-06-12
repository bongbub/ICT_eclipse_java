package ch09_re;

import java.util.Scanner;

// 2025.6.12	복습

public class _05_ThrowsExceptionEx {

	// 이름을 입력받고, 2글자보다 작으면 예외
	
	static Scanner scan = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		try {
			String namee = readName();
			System.out.println("이름 :"+namee);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			//e.printStackTrace();
		}finally {
			System.out.println("뭘해도 나오는 파널구문");
			scan.close();
		}
		System.out.println("이름입력 종료 (정상종료)");
		
	}
	
	public static String readName() throws Exception {
		System.out.print("이름을 입력하세요 :");
		String name = scan.next();
		
		if(name.length() < 2) {
			// 입력받은 이름의 길이가 2보다 작다면
			throw new Exception("이름은 2글자 이상 입력해야합니다.");
		}
		return name;
	}
}
