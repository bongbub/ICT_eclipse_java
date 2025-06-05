package ch03_re;

import java.util.Scanner;

public class _01_ifEx {
	public static void main(String[] args) {
		
		// 8살 이사잉면 '학교에 다닙니다" 출력, 그렇지 않으면 "학교에 다니지 않습니다 출력
		
		Scanner scan = new Scanner(System.in);
		System.out.print("나이를 입력하세요 :");
		int age = scan.nextInt();
		
		
		if(age>=8) {
			System.out.println("학교에 다닙니다.");
		}
		else {
			System.out.println("학교에 다니지 않습니다.");
		}
		scan.close();
	}

}
