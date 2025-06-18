package ch08;

import java.util.List;

// 2025.6.10	(2교시)
// 매개변수 생성자를 통해 값을 전달하는 것이 아닌, set으로 직접 전달

public class _05_MemberArrayListMain {
	public static void main(String[] args) {

		
		_05_MemberArrayList mlist = new _05_MemberArrayList();
		
		List<_05_Member> list = mlist.addMember();
		System.out.println("향상된 for문");
		for(_05_Member member : list) {
			System.out.println(member.toString());
		}
		
		

		
		
	}
}
