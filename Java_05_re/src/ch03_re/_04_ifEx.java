package src.ch03_re;

import java.util.Scanner;

public class _04_ifEx {
	public static void main(String[] args) {
		
		// 90이상 A / 80이상 B / 70이상 C / 60이상 D / 60미만 F
		// 범위 밖은 F
		// || : 논리합 (OR)-> 양쪽 모두 거짓일 때 거짓
		// && : 논리곱 (AND) -> 양쪽 모두 참일때 참
		
		
		Scanner scan = new Scanner(System.in);

		System.out.print("점수를 입력하세요. :");
		
		int score = scan.nextInt();
		char grade = ' ';
		if((score > 100) || (score < 0)) {
			grade = 'W';
		}else if(score >= 90) {
			grade = 'A';
		}else if(score >= 80) {
			grade = 'B';
		}else if(score >= 70) {
			grade = 'C';
		}else if(score >= 60) {
			grade = 'D';
		}
		else {
			grade = 'F';
		}
		System.out.println(score + "=>" + grade);
		scan.close();
	}

}
