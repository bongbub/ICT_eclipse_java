package ch05;

import java.util.Random;
import java.util.Scanner;

public class _01_ArreayEx {
	public static void main(String[] args) {
		
		// 2025.5.29
		/*
		    * 배열(Array) : 대량의 동일한 자료형의 데이터를 한꺼번에 저장할 수 있는 저장장소이다.
		    * 방법1) 선언과 생성을 따로 한다.
		    * int[] scores; // 선언
		    * scores = new int[갯수]; // 생성
		    * scores[index] = 값;
		    * 

		    * 
		    * 방법3) int[] scores = new int[] {값1, 값2,...} // 갯수는 생략해야 함. 추천
		    * 
		    * 방법4) 선언과 할당을 동시에 한다. .. 제일 많이 사용
		    * int[] scores = {값1, 값2,...};
		    */
		
		 
		/*
 		    * 방법2) 선언과 생성을 동시에 한다. .. 추천
		    * int[] scores = new int[갯수];
		    * scores[index] = 값;
		 */
		int[] scores = new int[10];
		scores[0] = 10;
		scores[1] = 20;
		scores[2] = 30;
		scores[3] = 40;
		scores[4] = 50;
		
		for(int i=0; i<scores.length; i++) {
			System.out.println(scores[i]);
		}
		
		
		
		System.out.println("방 10개 만들어서 for문으로 출력하기");
		
		int[] rooms = {1,2,3,4,5,6,7,8,9,10};
		for(int i=0; i<rooms.length; i++) {
			System.out.printf("[%d]번째 방에는 %d가 들어있습니다.",i,rooms[i]);
			System.out.println("");
		}
		
		// 향상된 for문 사용
		for(int num : rooms) {
			System.out.printf("[%d}번 내부 : %d", num, rooms[num]);
			System.out.println();
		}
		
		
		// 그냥 해보는 랜덤수출력하기
		
		Random random = new Random();
		Scanner scan = new Scanner(System.in);
		
		// 마지막 수 받기
		int lastnum = scan.nextInt();
		int[] nums = new int[lastnum];
	
		
		// 
		for(int i=0; i< nums.length; i++) {
			nums[i] = random.nextInt(lastnum);
			
		}
		
//		int selnum = scan.nextInt();
//		for(int j=0; j)
		scan.close();
		
	}

}
