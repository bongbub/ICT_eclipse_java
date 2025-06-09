package ch08;

//2025.6.9	(7교시)
//p 429


public class _04_MemberArrayListMain {
	public static void main(String[] args) {
		
		
		_04_MemberArrayList mem = new _04_MemberArrayList();
		
		_04_Member lee = new _04_Member(1001,"이지원");		// 매개변수 -> 멤버변수로 값 전달
		_04_Member son = new _04_Member(1002,"손민국");		// 매개변수 -> 멤버변수로 값 전달
		_04_Member park = new _04_Member(1003,"박서훤");		// 매개변수 -> 멤버변수로 값 전달
		_04_Member hong = new _04_Member(1004,"홍길동");		// 매개변수 -> 멤버변수로 값 전달
		
		
		mem.addMember(lee);		// lee = new _04_Member(1001,"이지원");
								// 즉 매개변수에서 멤버변수로 값을 전달하는 과정
		mem.addMember(son);
		mem.addMember(park);
		mem.addMember(hong);
		
		mem.showAllMember();
		
		// 삭제
		mem.removeMember(1004);
		mem.showAllMember();
		
		
	}
}
