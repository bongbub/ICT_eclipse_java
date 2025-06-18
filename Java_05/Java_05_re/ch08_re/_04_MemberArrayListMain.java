package ch08_re;

// 2025.6.9 	복습

public class _04_MemberArrayListMain {
	public static void main(String[] args) {
		 
		// 생성자
		_04_MemberArrayList list = new _04_MemberArrayList();
		
		
		_04_Member kar = new _04_Member(1001, "카리나");
		_04_Member son = new _04_Member(1002, "손흥민");
		_04_Member park = new _04_Member(1002, "박보영");
		_04_Member lee = new _04_Member(1004, "이영지");
		
		
		// 추가
		list.addMem(kar);
		list.addMem(son);
		list.addMem(park);
		list.addMem(lee);
		
		
		// 출력
		list.showAllMember();
		
		System.out.println("------ 삭제 후 출력 ------");
		
		// 삭제 후 출력
		list.removeMember(1002);
		list.showAllMember();
		
	}

}
