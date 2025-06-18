package ch08;

// 2025.6.10 7교시

public class _07_Main {
	
	public static void main(String[] args) {
		
		// 생성자로 해쉬맵 초기화
		_07_MemberHashMap map = new _07_MemberHashMap();
		
		// 매개변수 생성자로 Member의 멤버변수에 값 전달
		_07_Member lee = new _07_Member(1001, "이지원");
		_07_Member son = new _07_Member(1002, "손민국");
		_07_Member kim = new _07_Member(1003, "김태희");
		_07_Member hong = new _07_Member(1004, "홍길동");
		
		// 회원추가 메서드 호출
		map.addMember(lee);
		map.addMember(son);
		map.addMember(kim);
		map.addMember(hong);
		
		
		// 회원 출력
		map.showAllMember();
		
		System.out.println(" --- 제거 후 출력 --- ");
		// 제거 후 출력
		map.removeMember(1002);
		map.showAllMember();
	}

}
