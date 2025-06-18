package ch08_re;

// 2025.6.9 	복습시간

public class _04_Member {

	// 멤버변수
	private int memberId;
	private String memberName;
	 
	// 매개변수생성자
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
	@Override // 부모(Object)에 있는 toString()메서드 재정의
	public String toString() {
		return memberId + "의 회원명은 " + memberName +" 입니다. ";
	}
}
