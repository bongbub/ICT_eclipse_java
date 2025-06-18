package test;

import java.util.ArrayList;

//2025.6.9	(5교시)
//p 425


public class _04_MemberArrayList {
	
	private ArrayList<_04_Member> arrayList;		// ArrayList 선언
	
	
	// 디폴트생성자
	public _04_MemberArrayList() {
		arrayList = new ArrayList<_04_Member>();
	}
	
	// 추가메서드 생성
	public void addMember(_04_Member member) {
		arrayList.add(member);		// arrayList에 회원을 추가하는 메서드
	}
	
	// 삭제메서드 생성
	public boolean removeMember(int memberId) {
		for (int i = 0; i < arrayList.size(); i++) {
			_04_Member member = arrayList.get(i);
			int tempId = member.getMemId();
			if (tempId == memberId) {
				arrayList.remove(i);
				return true;
			}
		}
		System.out.println( memberId+"가 존재하지 않습니다.");
		return false;
	}
	
	
	// 조회메서드 생성
	public void showAllMember() {
		for (_04_Member member : arrayList) {
			System.out.println(member);
		}
		System.out.println( );
	}

}
