package ch03_re;

public class _07_WhileEx {

	public static void main(String[] args) {
		
		// 반복문 : 조건이 참인 동안 계속해서 반복 수행 (-> while, for)
		// 초기값 -> 조건식 -> 증감식
		
		//[while문 문법]
		// 1. 초기값
		//while(조건식){
		//    수행문
		//    증감식;
		//}
		//수행문2;
		
		
		int count = 1;
		
		while(count <=5) {
			System.out.println("HappyDay" + count + "^ㅡ^");
			count++;
		}
		System.out.println();
		System.out.println((count-1) +"번 반복, "+ "반복문 종료.");
	}
}
