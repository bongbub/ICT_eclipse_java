package ch09;

import java.util.Scanner;

// 2025.6.12	3교시

public class _05_ThrowsException {
	static Scanner scan = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		
		// 이름입력 호출
		// 이름의 길이가 2보다 커야합니다.
		try {
			String name1 = readName();
			System.out.println("이름이 정상 출력되었습니다."+name1);
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		finally {
			scan.close();
		}
		System.out.println("이름입력 끝");
		scan.close();
	}
	
	
	public static String readName() throws Exception {
		System.out.print("이름을 입력해주세요 :");
		String name = scan.next();
		if(name.length()<2) {
			throw new Exception("이름은 2글자 이상으로 입력해야합니다.");
		}
		return name;
	}
}
