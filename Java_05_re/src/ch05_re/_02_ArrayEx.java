package src.ch05_re;

public class _02_ArrayEx {
	public static void main(String[] args) {
		
		// 배열 복습
		String[] drink01 = new String[5];
		drink01[0]="콜라";
		drink01[1]= "제로콜라";
		drink01[2]="환타";
		drink01[3]="사이다";
		drink01[4]="스프라이트";
		
		String[] drink02 = {"솔의눈","데자와","맥콜","아침햇살","실론티"};
		
		
		for(int i = 0; i<drink02.length; i++) {
			System.out.printf("%d 위 : %s",i+1,drink02[i]);
			System.out.println("");
		}
		for(int i = 0; i<drink01.length; i++) {
			System.out.printf("%d 위 : %s",i+1,drink01[i]);
			System.out.println("");
		}
	}


}
