package ch08;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// 2025.6.10	(2교시)
// 매개변수 생성자를 통해 값을 전달하는 것이 아닌, set으로 직접 전달

// ArrayList에 Member 데이터를 추가, 삭제, 조회
public class _05_MemberArrayList {
	
	
	private ArrayList<_05_Member> list;
	// 디폴트 생성자
	public _05_MemberArrayList() {
	}
	 
	// 리스트 추가 메서드 // 바로 출력하려면? return 타입을 list로!!(왜냐 리스트에 담겨 있으니까)
	public List<_05_Member> addMember() {
		
		list = new ArrayList<_05_Member>();
		// 반복자 생성
		Iterator<_05_Member> iterator = list.iterator();
		
		while(iterator.hasNext()) {
			_05_Member dto = new _05_Member();
			dto.setMemId(1001);
			dto.setMemName("이지원");
			
			// list에 dto 추가
			list.add(dto);
			
		}
		return list;
	}

	
	// 삭제메서드
	public boolean removeMember(int memberId) {
		for(int i = 0; i < list.size(); i++) {	// get() 메서드로 회원을 순차적으로 가져옴
			_05_Member member = list.get(i);	// 현재 i번째 인덱스의 값을 가져옴(멤버타입) 
												// -> 리스트 안에 담긴 자료형과 똑같은 타입으로 꺼내야 함
			int tempId = member.getMemId();		// 0번째 - 1001 => 현재 회원의 번호를 가져옴
			
			// 만약 tempId와 memberId가 같을때만 삭제
			if(tempId == memberId ) {	// 삭제하려는 아이디와 비교해서 동일하다면
				list.remove(i);			// 해당 회원 삭제
				return true;			// removeMember에 참값을 전달. for문은 계속 돎 (-> false 구문으로 가지 않음)
										// 삭제 후 false 구문을 실행하지 않아야할 때. (== skip)
			} 
		}
		System.out.println(memberId + "가 존재하지 않습니다.");		// 반복문이 끝날 때까지 해당 아이디를 못 찾는 경우
		return false;					// 종료. removeMember()메서드를 빠져나감
	}
	
	
	// 리스트 조회 및 출력
//	public void showAllMember() {
//		for( _04_Member member : list) {	// add()를 통해 list에 담은 값을 member즉 _04_Member에 넣어라 
//											// 왜냐!? -> toString() 으로 출력해야하니까
//			System.out.println(member.toString());
//		}
//		System.out.println();		// 회원이 바뀔때마다 빈줄 출력
//	}

}
