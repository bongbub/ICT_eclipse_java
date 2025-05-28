package ch02;

public class _09_WhileEx {
	public static void main(String[] args) {
		/*
		 * === 2단 ===
		 * 2 * 1 = 2
		 * ...
		 * 2 * 9 = 18
		 * ==========
		 */
		
		int dan = 2;    
		int i = 1;
		
		System.out.println("=== " + dan + "단 ===");
		
		while(i <= 9) {
			System.out.println(dan + " * " + i + " = " + (dan * i));
			i++;
		}
		System.out.println("==========");
	}
}
