package ch08_re;

// 2025.6.10 (6교시)

public class _05_Member {
	
	// 멤버변수
	private int memberId;
	private String membername;
	
	// 매개변수 생성자
	public _05_Member(int memberId, String membername) {
		this.memberId = memberId;
		this.membername = membername;
	}
	
	// getter setter
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	
	// toString()
	@Override
	public String toString() {
		return "회원정보" + memberId + "회원명 "+ membername;
	}
}
