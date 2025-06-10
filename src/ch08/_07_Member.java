package ch08;

// 2025.6.10 (6교시)

public class _07_Member {

	// 멤버변수
	private int memberId; // 회원아이디
	private String memberName; // 회원명

	// 디폴트 생성자
	public _07_Member() {

	}

	// 매개변수 생성자
	public _07_Member(int memberId, String memberName) {
		this.memberId = memberId;
		this.memberName = memberName;
	}

	// 멤버 메서드(getter, setter)
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
	@Override					
	public String toString() {		
		return "회원아이디 : " + memberId + "  ~  이름 : " + memberName;
	}
	
}
