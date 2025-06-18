package ch08_re;

import java.util.ArrayList;
import java.util.Iterator;

// 2025.6.9 	복습시간

public class _04_MemberArrayList {

	// 디폴트 생성자 생성
	ArrayList<_04_Member> mem = new ArrayList<_04_Member>();
	
	// 전역변수로 사용하기 위해 다르게 생성하기
	private ArrayList<_04_Member> list;
	public _04_MemberArrayList() {
		list = new ArrayList<_04_Member>();
	}
	 
	// 리스트추가
	public void addMem(_04_Member member) {
		list.add(member); 		// 매개변수 -> 멤버변수로 저장된 데이터를 리스트에 저장
	}
	
	
	// 리스트삭제	
	public boolean removeMember(int memberId) {
		for(int i = 0; i < list.size(); i++) {
			_04_Member member = list.get(i);
			int tempId = member.getMemId();	// _04_Member에서 memberId 하나씩 가져옴
			if(tempId == memberId) {
				list.remove(i);
				return true;
			}
		}
		System.out.println(memberId + "가 존재하지 않습니다. ");
		return false;
	}
	
	// 리스트 조회 및 출력
	public void showAllMember() {
		// 향상된 for문
		System.out.println("--- 향상된 for문! ---");
		for (_04_Member member : list ) {
			System.out.println(member.toString());	//toString() 생략가능
		}
		
		// 반복자를 이용한 출력
		System.out.println("--- 반복자 Iterator! ---");
		Iterator<_04_Member> iterator = list.iterator();
		while(iterator.hasNext()) {	// list가 값을 갖고 있으면
			_04_Member member = iterator.next();
			System.out.println(member);
		}
	}
	
}
