package ch08_re;

import java.util.ArrayList;

// 2025.6.5 예제 복습

public class _01_ArrayList {

	public static void main(String[] args) {
		
		// ArrayList 추가 사용하기 위해 Java.Util추가
		// <>다이아몬드 연산자 안에는 데이터타입클래스가 옴
		ArrayList<String> arr = new ArrayList<String>();
		
		// 추가 - .add
		arr.add("안녕");
		arr.add("하세요");
		arr.add("(◦'⌣'◦)");
		
		// for문을 통해 출력
		for (int i=0; i<arr.size(); i++) {
			System.out.println(arr.get(i));
			try {
				Thread.sleep(2000);  // 2초 쉬기
			}catch(InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		// 향상된 for문도 사용
		ArrayList<String> arr2 = new ArrayList<String>();
		arr2.add("ദ്ദി  ͡° ͜ʖ ͡°)");
		arr2.add("҉*( ‘ω’ )/*҉");
		arr2.add("(◍ ´꒳` ◍ )");
		
		for(String j : arr2) {
			System.out.println(j);  // 한 개씩 출력
			System.out.println(arr2); // 한 번에 반복출력
		}
	}
}
