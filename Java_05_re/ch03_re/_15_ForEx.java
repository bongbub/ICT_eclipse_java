package ch03_re;

public class _15_ForEx {
	public static void main(String[] args) {
		
		int total = 0;
		int num;
		
		for (num = 0; num < 100; num++) {
			if (num%2 == 0) {
				continue;
			}
			total += num;
		}
		System.out.println("1부터 100까지 홀수의 합은 "+total +"입니다.");
	}

}
