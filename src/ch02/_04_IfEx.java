package ch02;

public class _04_IfEx {
	public static void main(String[] args) {
		
		/*
		 * if문을 이용한 학점 구하기
		 * 1. 점수는 score 변수, 학점은 grade 변수
		 * 2. 점수가 90점 이상이면 A
		 *    점수가 80점 이상이면 B
		 *    점수가 70점 이상이면 C
		 *    점수가 60점 이상이면 D
		 *    점수가 60점 미만이면 F
		 *    범위를 벗어나면 W
		 * 3. 결과출력 => 점수 : 80, 학점 : B
		 * 
		 * || : 논리합 : OR(또는) => 양쪽 모두 거짓일 때 거짓
		 * && : 논리곱 : AND(이면서) => 양쪽 모두 참일때 참
		 *    
		 */
		
		int score = 40;
		char grade = ' ';
		if((score > 100) || (score < 0)) {	// 논리합(또는) : 둘중 하나만 참이어도 참
			grade = 'W';
		}
		else if(score >= 90) {
			grade = 'A';
		}
		else if(score >= 80) {
			grade = 'B';
		}
		else if(score >= 70) {
			grade = 'C';
		}
		else if(score >= 60) {
			grade = 'D';
		}
		else {
			grade = 'F';
		}
		
		System.out.println(score + " : " + grade);
	}

}
