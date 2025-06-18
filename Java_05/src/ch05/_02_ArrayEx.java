package ch05;

public class _02_ArrayEx {
	public static void main(String[] args) {

		// 방법1. 선언과 생성을 동시에
		// int[] 배열명 = new int[갯수];
		// 배열명[인덱스 번호] = 값;

		String[] drink01 = new String[5];
		drink01[0] = "콜라";
		drink01[1] = "제로콜라";
		drink01[2] = "스프라이트";
		drink01[3] = "환타";
		drink01[4] = "사이다";
		

		// 방법2. 선언과 할당을 동시에 한다 제일 많이 사용
		// int[] 배열명 = {값1, 값2, ... 값n};
		String[] drink02 = {"솔의눈", "실론티", "데자와", "맥콜", "아침햇살"};
		
		System.out.println("=== 음식점 음료 랭킹 top 5 ===");
		for(int i =0; i<drink01.length; i++) {
			System.out.printf("%d 위 : %s",i+1,drink01[i]);
			System.out.println("");
		}
		System.out.println("");
		
		System.out.println("=== 호불호 음료 랭킹 top5 ===");
		for(int i =0; i<drink02.length; i++) {
			System.out.printf("%d 위 : %s",i+1,drink02[i]);
			System.out.println("");
		}
		
		
		System.out.println("-----------------------향상된 for문사용");
		// for(변수 : 배열){
		//		반복문 실행;
		//}
		
		int index=1;
		for(String test1 : drink01) {
			System.out.printf("%d번째 : %s", index,test1);
			System.out.println("");
			index++;
		}
		for(String test2 : drink02) {
			System.out.println(test2);
		}
		
		
		
	}

}
