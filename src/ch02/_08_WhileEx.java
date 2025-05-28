package ch02;

public class _08_WhileEx {
	public static void main(String[] args) {
		
		/*
		반복문 : 조건이 참인 동안 계속해서 반복수행(while문, for문)
		       1.초기값 -> 2.조건식 -> 3.증감식
		       
		[ while 문법 ]
		1. 초기값;
		while(조건식) { // 2. 조건식
			수행문1;
			증감식;  // 3. 증감식
		}
		수행문2;
		 */
		
		System.out.println("=== 1. 1~10까지 합계 출력 ===");
		// 1~10까지의 합계 : 결과값
		// 반복문 종료~~
		
		// 1.초기값
		int i = 1;  
		int sum = 0;
		
		while(i <= 10) { // 2. 조건식
			sum += i;	// sum = sum + i;
			i++;  // i = i + 1;  3. 증감식
		}
		System.out.println("1~10까지의 합계 : " + sum);   // 1~10까지의 합계 : 55
		System.out.println("반복문 종료~~");
		
		System.out.println("=== 2. 1~10까지 합계 과정 출력 ===");
		
		//  j   total
		//  1 + 0 = 1
	    //  2 + 1 = 3
		//  10 + 45 = 55
		// 반복문 종료~~
		
		// 1.초기값
		int j = 1;
		int total = 0;
		
		while(j <= 10) {  // 2. 조건식
			System.out.println(j + " + " + total + " = " + (j + total));
			total += j;
			j++;	// 3. 증감식
		}
		System.out.println("반복문 종료~~");
	}
}
