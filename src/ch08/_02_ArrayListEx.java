package ch08;

import java.util.ArrayList;

// 2025.6.9  아침 테스트
/*
ArrayList 생성 문법 ->
추가메서드명, 삭제메서드명, 조회메서드명

ArrayList에 추가해서 출력하기

1. 추가 -> 봄 여름 가을 겨울
   조회 -> for문
	      향상된 for문


2. 추가 ->  90 80 70 60 50
   조회 ->  for문으로 합계
		향상된 for문으로 합계
*/


public class _02_ArrayListEx {
	public static void main(String[] args) {
		ArrayList<String> array = new ArrayList<String>();

		System.out.println(" === for문으로 출력 ===");
		array.add("봄");
		array.add("여름");
		array.add("가을");
		array.add("겨울");

		for (int i = 0; i<array.size(); i++){
			System.out.println(array.get(i));
		}
		
		System.out.println(" === 향상된 for문으로 출력 ===");
		for(String i : array){
			System.out.println(array);
		}
		
		System.out.println("");
		System.out.println("-----------------------------");
		System.out.println("");

		ArrayList<Integer> arr = new ArrayList<Integer>();
		System.out.println(" === for문으로 출력 ===");
		arr.add(90);
		arr.add(80);
		arr.add(70);
		arr.add(60);
		arr.add(50);
		int sum=0;
		int sum2=0;
		
		
		for(int j = 0; j<arr.size(); j++){
			sum += arr.get(j);
		}
		System.out.println("합계 :"+sum);
		
		System.out.println(" === 향상된 for문으로 출력 ===");
		for(int j : arr) {
			sum2 += j;
		}
		
		System.out.println("합계 :"+sum2);
		
	}

	// 날라간 잔디 테스트... 2...3
}
