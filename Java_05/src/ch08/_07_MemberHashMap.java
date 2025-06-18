package ch08;

import java.util.HashMap;
import java.util.Iterator;

// 2025.6.10 6교시

public class _07_MemberHashMap {
	
	// 해쉬맵 참조변수 전역변수로 만들어서
	HashMap<Integer, _07_Member> map ;
	// 디폴트 생성자로 선언
	public _07_MemberHashMap() {
		map = new HashMap<Integer, _07_Member>();
	}
	
	// 회원추가 메서드 addMember
	public void addMember(_07_Member member) {
		map.put(member.getMemId(), member);
	}
	
	
	// 회원제거 메서드 removeMember
	public boolean removeMember(int memberId) {
		if(map.containsKey(memberId)) {
			map.remove(memberId);
			return true;
		}else {
			return false;
		}
	}
	
	
	// 출력 메서드 showAllMember
	
	public void showAllMember() {
		Iterator<Integer> iterator = map.keySet().iterator();
		while(iterator.hasNext()) {
			int key = iterator.next();
			_07_Member member = map.get(key);
			System.out.println(member.toString());
		}
	}
	

}
