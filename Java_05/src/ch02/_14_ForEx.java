package ch02;

public class _14_ForEx {
	public static void main(String[] args) {
	/*
		 * for문으로 구구단 작성
		 * 2~9단까지 출력
		 * 
		 * ****************
		 * *** 구구단 출력 ***
		 * ****************
		 * === 2단 ===
		 * 2 * 1 = 2
		 * ...
		 * 2 * 9 = 18
		 * === 9단 ===
		 * 9 * 1 = 9
		 * ...
		 * 9 * 9 = 81
		 * ==========  마지막에 한번만
		 */

		
		for (int i=2; i<10; i++) {
			System.out.println("====="+i+"단=====");
			for(int j=1; j<10; j++) {
				System.out.println(i+" * "+j+" = "+i*j);
			}
			System.out.println("\n");
		}
		
		
	}
	
}
