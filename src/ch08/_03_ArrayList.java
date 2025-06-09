package ch08;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// 2025.6.9  ((3교시))


public class _03_ArrayList {
	public static void main(String[] args) {
		
		/*
		 * 7. 삭제 : list.remove(삭제할 위치 index);
	     * 8. 검색 : list.indexOf(검색할 값);    // 중요
	     *         => 리스트에서 검색할 값과 똑같은 값을 갖는 첫번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.
	     *
	     *         list.lastIndexOf(검색할 값)
	     *            => 리스트에서 검색할 값과 똑같은 값을 갖는 마지막번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.         
	     *
	     *         검색할 값과 일치한 데이터가 없으면 -1을 리턴한다.
		 */
		
		
		// HONG KILDONG
		// ArrayList 생성
		List<String> arr = new ArrayList<String>();
		
		// 한 글자씩 자료 삽입
		arr.add("H");	// 0번째
		arr.add("O");
		arr.add("N");
		arr.add("G");
		arr.add("K");
		arr.add("I");	// 5번째
		arr.add("L");
		arr.add("D");
		arr.add("O");
		arr.add("N");
		arr.add("G");	// 10번째
		
		// 일치하는 첫 번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.
		System.out.println("G문자의 인덱스 :" + arr.indexOf("G"));
		System.out.println("N문자의 인덱스 :" + arr.indexOf("N"));
		
		
		System.out.println("G문자의 마지막 인덱스 :" + arr.lastIndexOf("G"));
		System.out.println("N문자의 마지막 인덱스 :" + arr.lastIndexOf("Z"));
		
		
		System.out.println(" -- for문으로 출력 --");
		for(int i = 0; i<arr.size(); i++) {
			System.out.print(arr.get(i) + " ");
		}
		System.out.println("");
		
		
		System.out.println(" -- 향상된 for문을 출력 --");
		// 전체 리스트 출력 :
		for(String j : arr) {
			System.out.print(j + " ");
		}
		System.out.println("");

		System.out.println(" -- Iterator 정복자 -- ");
		Iterator<String> ite = arr.iterator();
		while(ite.hasNext()) {
			String text = ite.next();
			System.out.print(text + " ");
		}
		System.out.println("");
		
		
		
		// 7. 삭제 : list.remove(삭제할 위치 index);
		System.out.println(" <<< remove >>>");
		arr.remove(4);		// K삭제
		
		for(String str : arr) {
			System.out.print(str + " ");
		}
		System.out.println("");
		
		// 9. 전체 삭제 : list.clear();
		System.out.println(" <<< .clear() 전체삭제 >>>");
		arr.clear();
		for(String str : arr) {
			System.out.print(str + " ");
		}
		// ===> 값이 없음 (출력x)
		
	}

	
}

