package ch08;

// 2025.6.10	(2교시)
// 매개변수 생성자를 통해 값을 전달하는 것이 아닌, set으로 직접 전달

// 데이터클래스			// extends Object 	모든 부모(기본)클래스는 Object를 상속함. 생략했을 뿐
public class _05_Member {

	// 멤버변수
	private int memberId; // 회원아이디
	private String memberName; // 회원명

	// 디폴트 생성자
	public _05_Member() {

	}

	// 매개변수 생성자
	public _05_Member(int memberId, String memberName) {
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
	@Override						// 재정의하면 자식의 멤버변수 정보를 출력
	public String toString() {		// 원래 부모인 Object의 toString()은 주소값 출력
		return "회원아이디 : " + memberId + "  |  이름 : " + memberName;
	}

}
