package ch10;


// 2025.6.13	5교시

public class _06_StringBuffer {

	public static void main(String[] args) {


		/* 
	       * StringBuffer : 문자열을 추가하거나 변경할 때 주로 사용하는 자료형이다.
	       * - 추가 : append()
	       * - 삽입 : insert(시작위치, 문자열) : 특정 위치에 원하는 문자열을 삽입한다.
	       * - subString(시작위치, 끝위치) : 시작위치에서 끝위치-1 까지의 문자열을 추출한다. 공백포함
	       *                             인덱스는 0부터 시작하며, 끝위치보다 작아야 한다.
	       * - toString() : 메서드를 이용해서 String형으로 변경한다.
	       */
		
		// 추가 : append()
		StringBuffer sb = new StringBuffer();
		sb.append("맛있게 ");
		sb.append("먹으면 ");
		sb.append("0칼로리!!!");
		System.out.println("sb : "+ sb);						// sb : 맛있게 먹으면 0칼로리!!!
		System.out.println("sb.toString() : "+ sb.toString());  // sb.toString() : 맛있게 먹으면 0칼로리!!!

		
		// 삽입 : insert(시작위치, 문자열);  : 특정 위치에 원하는 문자열을 삽입한다.
		sb.insert(8, "정말로? ");
		System.out.println("sb : "+ sb);		// sb : 맛있게 먹으면 정말로? 0칼로리!!!

		
		
		// subString(시작위치, 끝위치) : 시작위치는 0부터 시작, 끝위치 = 끝위치 -1 까지 문자열을 추출한다(공백포함)
		//							끝위치 생략 시 끝까지 간다
		System.out.println(sb.substring(12, 16)); 		//  0칼로
		System.out.println(sb.substring(4));   			// 먹으면 정말로? 0칼로리!!!
		
		
		
		
		
	}
	
	
}
