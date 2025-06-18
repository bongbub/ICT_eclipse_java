package ch08_re;

import java.util.HashMap;
import java.util.Iterator;

// 2025.6.10 (6교시)

public class _05_MemberHashMap {

	// 해쉬맵 전역변수
	HashMap<Integer, _05_Member> map;

	// 디폴트 생성자로 해쉬맵 초기화
	public _05_MemberHashMap() {
		map = new HashMap<Integer, _05_Member>();
	}

	// addMember()
	public void addMember(_05_Member member) {
		map.put(member.getMemberId(), member); // getMemberId로 아이디(int)가져오고 member로 memberId, membername가져오기
	}

	// removeMember()
	public boolean removeMember(int memberId) {
		if(map.containsKey(memberId)) {
			map.remove(memberId);
			return true;
		}
		else {
			System.out.println("아이디가 없습니다 ");
			return false;
		}
	}

	// showAllMember()
	public void showAllMember() {
		Iterator<Integer> ite = map.keySet().iterator();
		while(ite.hasNext()) {
			int key = ite.next();
			_05_Member member = map.get(key);
			System.out.println(member.toString());
		}
	}

}
