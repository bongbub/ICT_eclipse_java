package ch08_re;

// 2025.6.10

public class _05_MemberHashMapTest {

	public static void main(String[] args) {
		
		// 해쉬맵클래스 초기화
		_05_MemberHashMap map = new _05_MemberHashMap();
		
		
		
		// 매개변수 생성자로 값 전달
		_05_Member lee = new _05_Member(1001, "이수지");
		_05_Member hong = new _05_Member(1002, "홍길동");
		_05_Member kim = new _05_Member(1003, "김태희");
		_05_Member park = new _05_Member(1004,"박지성");
		
		// 전달한 값 해쉬맵 전달
		map.addMember(lee);
		map.addMember(hong);
		map.addMember(kim);
		map.addMember(park);
		
		System.out.println(" -- 출력 --");
		// 출력
		map.showAllMember();
		System.out.println("");
		
		System.out.println(" -- 김태희 제거 후 출력 --");

		// 값 제거하고 출력
		map.removeMember(1003);
		map.showAllMember();
		System.out.println("");
		
	}
}
