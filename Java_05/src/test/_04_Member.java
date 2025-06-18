package test;

// 2025.6.9	(6교시)
// p425


public class _04_Member {

	// 멤버변수
	private int memberId;			// 회원아이디
	private String memberName;		// 회원이름
	
	// 매개변수 생성자
	public _04_Member(int memberId, String memberName) {
		this.memberId = memberId;
		this.memberName = memberName;
	}
	
	// getter setter
	public int getMemId() {
		return memberId;
	}
	public void setMemId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemName() {
		return memberName;
	}
	public void setMemName(String memberName) {
		this.memberName = memberName;
	}
	
	// toString()
	public String toString() {
		return memberName + " 회원님의 아이디는 " + memberId + "입니다.";
	}
}
