package ch02;

public class _13_ForEx {
	public static void main(String[] args) {
		/*
		 * for문을 이용해 구구단 출력
		 * === 2단 ===
		 * 2 * 1 = 2..
		 * 2 * 9 = 18
		 * =========== 
		 */
		int dan = 2;
		System.out.println("=== " + dan + "단 ===");

		for (int i = 1; i <= 9; i++) {
			System.out.println(dan + " * " + i + " = " + (dan * i));
		}

		System.out.println("==========");
	}
}
