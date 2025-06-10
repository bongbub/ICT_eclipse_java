package ch08;

import java.util.HashMap;

// 2025.6.10 (3~4교시)

public class _06_HashMap {
	public static void main(String[] args) {
	
		/*
	     * p457
	     * 해싱(hashing) : 키를 이용해서 해시테이블로부터 데이터를 가져오는 과정
	     * 
	     * [면접] p457
	     * HashMap
	     * 1) 특징
	     * - 데이터의 ★순서를 보장하지 않는다.★
	     * - key와 value ★쌍★으로 저장한다. 
	     * - key는 중복되면 안된다. 값은 중복되도 무관하다.
	     * - key를 이용해서 value를 가져올 수 있다.
	     * - List 계열과 달리 index가 없다.
	     * - Map이라는 인터페이를 구현한 클래스이다.
	     * 
	     * 2) 선언
	     * - HashMap<Key 클래스타입, value 클래스타입> map = new HashMap<Key 클래스타입, value
	     * 클래스타입>();
	     * - Map<Key 클래스타입, value 클래스타입> map = new HashMap<Key 클래스타입, value 클래스타입>(); // 다형성 적용
	     * 
	     * 3) 메서드    -- > 예약어
	     * - 데이터 추가 : put(key, value);
	     * - 데이터 가져오기 : get(key)
	     * - 데이터 삭제 : remove(key)
	     * - 데이터가 비어있는지 여부 : isEmpty()
	     * - 해당 키가 있는지 여부 : containsKey(key)
	     * - 해당 값이 있는지 여부 : containsValue(value)
	     * - 해당 갯수 : size()
	     */
		
//	     2) 선언
//	     - HashMap<Key 클래스타입, value 클래스타입> map = new HashMap<Key 클래스타입, value
//	     클래스타입>();
//	     - Map<Key 클래스타입, value 클래스타입> map = new HashMap<Key 클래스타입, value 클래스타입>(); // 다형성 적용
//			1, 아이유     2, 유재석    3, 박명수    4, 박나래  -> Key Integer value String
		
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		map.put(1, "아이유"); 
		map.put(2, "유재석");
		map.put(3, "박명수");
		map.put(4, "박나래");
		map.put(5, "지현주");
		
		System.out.println(map);
		System.out.println("<<< 전체 데이터 for문으로 출력 >>>");
		for(int i=1; i<=map.size(); i++) {
			System.out.println(i+"번에는"+map.get(i));
		}
		
		System.out.println("<<< 박나래 출력 >>>");
		System.out.println(map.get(4));
		
		System.out.println(" <<< 박나래 삭제 후 전체 데이터 출력 >>>");
		System.out.println(map.remove(4));
		
		for(int i=1; i<=map.size(); i++) {
			System.out.println(i+"번 "+map.get(i));
		}
		
		// 데이터가 비어있는지 여부 : isEmpty()
		System.out.println(map.isEmpty());
		
		// 해당 키가 있는지 여부
		System.out.println(" -- 해당 키가 존재하는지 여부 : containsKey(key) --");
		System.out.println(map.containsKey(1));
		System.out.println(map.containsKey(2));
		System.out.println(map.containsKey(3));
		System.out.println(map.containsKey(4));
		System.out.println(map.containsKey(5));

		// 해당 값이 있는지 여부
		System.out.println(" -- 해당 값이 존재하는지 여부 : containsValue(value) --");
		System.out.println(map.containsValue("아이유"));
		System.out.println(map.containsValue("유재석"));
		System.out.println(map.containsValue("박명수"));
		System.out.println(map.containsValue("박나래"));
		
		System.out.println(" <<< 해당 개수 : size() >>>");
		System.out.println(map.size());
		
	}
}
