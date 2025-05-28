package ch02;

public class _12_ForEx {
	public static void main(String[] args) {
		/*
		 * 반복문 : 조건이 참인동안 반복(while문, for문)
		 * 
		 * for(초기값; 조건식; 증감식) {  // 반복횟수
		 *     수행문1;
		 *     수행문2;...
		 * }
		 */
		
		/* [ 1~10까지의 합 ]
		 * num=1, sum=1;
		 * num=2, sum=3..
		 * num=10, sum=55
		 * 
		 * 1~10까지의 합 : 55 => 밖에서 한번 출력
		 */
		
		int sum = 0;
		for(int num=1; num<=10; num++) {
			sum += num;
			System.out.println("num=" + num + "," + "sum=" + sum);
		}
		System.out.println("1~10까지의 합 : " + sum);
		
//      [ 1~10까지의 합 ]		
//		num=1,sum=1
//		num=2,sum=3
//		num=3,sum=6
//		num=4,sum=10
//		num=5,sum=15
//		num=6,sum=21
//		num=7,sum=28
//		num=8,sum=36
//		num=9,sum=45
//		num=10,sum=55
//		1~10까지의 합 : 55
	}
}
