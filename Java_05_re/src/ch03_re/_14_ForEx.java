package src.ch03_re;

public class _14_ForEx {

	public static void main(String[] args) {
		
		// for문으로 구구단 생성
		// 2~9단까지 출력
		// 마지막에 --- 한 번만 나오게 
		
		
		for(int i = 2; i<=9; i++) {
			System.out.println("====="+i+"=====");
			for(int j=1; j<10; j++) {
				System.out.println(i+" * " + j + " = " + (i*j));
			}
			System.out.println("==========");
			System.out.println("\n");
		}
	}
}
