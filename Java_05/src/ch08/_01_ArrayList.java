package ch08;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// 2025.6.5 (7교시)

public class _01_ArrayList {
	public static void main(String[] args) {
		
		/*
	       * [ArrayList]
	       * 
	       * Collection 인터페이스
	       * - List 인터페이스 : 클래스 종류는 ArrayList, Vector, LinkedList
	       * - Set 인터페이스 : 클래스종류는 HashSet, TreeSet
	       * - Map 인터페이스 : 클래스종류는 HashMap, HashTable, TreeMap
	       * 
	       *  <면접>
	       *  1. 특징
	       *  List 인터페이스 : 순서가 있는 자료관리, 중복허용한다.
	       *                 index를 사용하여 요소에 접근한다. (<<- 배열과 공통점)
	       *                 리스트에 들어있는 요소들의 인덱스는 0부터 시작한다.
	       *                 클래스종류는 ArrayList, Vector, LinkedList
	       *                 
	       *  Set 인터페이스 : 순서가 없는 자료관리, 중복허용 않는다.
	       *                클래스종류는 HashSet, TreeSet
	       * 
	       * 2. 선언
	       * 클래스명<데이터타입클래스> 참조변수 = new 클래스명<데이터타입클래스>();
	       * ArrayList<String> list = new ArrayList<String>();
	       * String[] arr = new String[5];  // 배열 : 정해진갯수만큼  but, Arraylist는 갯수가 정해져있지않음. add하는 만큼~
	       * 
	       * 다형성 적용
	       * List<String> list = new ArrayList<String>();
	       * 
	       * 3. 특징 : 데이터 순서가 있다. 중복허용된다.
	       * 4. 추가 : list.add(값);  // 앞에서부터 순서대로 추가
	       *         list.add(추가할 위치 index, 값);  // 지정한 인덱스에 값을 추가, 그 뒤의 값은 밀려난다.
	       * 5. 값 가져오기 : list.get(가져올 index);   // list.size()만큼 반복        
	       * 6. 교체 : list.set(교체할 위치 index, 값); // 지정한 인덱스의 값을 변경.. 그 뒤값은 그대로이다.
	       * 7. 삭제 : list.remove(삭제할 위치 index);
	       * 8. 검색 : list.indexOf(검색할 값);    // 중요
	       *         => 리스트에서 검색할 값과 똑같은 값을 갖는 첫번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.
	       *
	       *         list.lastIndexOf(검색할 값)
	       *            => 리스트에서 검색할 값과 똑같은 값을 갖는 마지막번째 데이터를 찾아서 그 위치의 인덱스를 리턴한다.         
	       *
	       *         검색할 값과 일치한 데이터가 없으면 -1을 리턴한다.
	       *         
	       * 9. 전체 삭제 : list.clear();
	       * 10. 반복자 : Iterator<E> iterator : while(hasNext())  { next() }
	       * 			인터페이스임
	       * 									다음값(has Next)이 존재하는 동안 반복 존재하면 next-> 출력
	       */
		
		
		// 선언
		// []: 인덱스 연산자    <> : 다이아몬드 연산자 (일반 자료형은 못 들어가고 데이터타입에 해당하는 클래스만 들어갈 수 있음)
		// 클래스명<데이터타입클래스> 참조변수 = new 클래스명<데이터타입클래스>();
		ArrayList<String> list = new ArrayList<String>();
		// Java.Util에 있는 클래스므로 패키지 츄가해줘야함
		list.add("치킨");
		list.add("치즈불닭볶음");
		list.add("오뎅탕");
		list.add("회");
		list.add("부추전");
		
		// 방법1) for문으로 출력하기
		System.out.println("방법1) for문을 통해 출력하기");
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i)+ "\n");
		}
		
		// 다형성 적용
		List<String> list2 = new ArrayList<String>();
		list2.add("꼬깔콘");
		list2.add("매운새우깡");
		list2.add("도도한나쵸");
		list2.add("바나나킥");
		list2.add("홈런볼");
		// 방법2) 향상된 for문
		System.out.println("방법2) 향상된 for문을 통해 출력하기");

		// list2안에 요소가 몇 개 있느냐에 따라 자동으로 반복
		for(String i : list2) {
			System.out.println(list2);
		}
		System.out.println("총 반복 횟수: " + list2.size() + "\n");
		
		
		System.out.println("방법3) 반복자를 통해 출력하기"); 
		// 반복자 생성
		Iterator<String> iterator = list.iterator();	
		// -> arraylist의 iterator()라는 메서드가 Iterator<>, 즉 반복자 기능을 할 수 있도록 돕겠다 라는 구절
		// Interator interator = list.iterator();  => 자료형 생략 시 가장 큰 자료형인 Object로 받음
		// Object란? 부모클래스가 상속하는 것. 원래 "클래스명 extends Object{ ...}" 임.. 생략된 것!
		
		// 값이 존재하는 동안 이동해가며 출력
		while(iterator.hasNext()) {	// ArrayList의 값이 존재하는지 체크
			String test = iterator.next();		// 값을 가져옴
			System.out.println(test);
		}
		System.out.println("");

		
		// Integer 형식을 Iterator로 출력하기
		System.out.println("방법3-2) Interger 형식을 Iterator로 출력");
		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(10);
		arr.add(20);
		arr.add(30);
		arr.add(40);
		arr.add(50);
		
		Iterator<Integer> ite = arr.iterator();
		while(ite.hasNext()) {
			Integer test = ite.next();
			System.out.println(test);
		}
		
		
	}
}
