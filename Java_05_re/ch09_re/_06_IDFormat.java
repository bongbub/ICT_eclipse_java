package ch09_re;


// p540
public class _06_IDFormat {

	// 멤버변수
	private String userID;
	
	// getter
	public String getUserID() {
		return userID;
	}
	
	// setter
	public void setUserID(String userID) throws _06_IDFormatException {
		if(userID == null) {
			throw new _06_IDFormatException("아이디는 null값을 가질 수 없습니다.");
		}
		if(userID.length() < 2 || userID.length() > 20) {
			throw new _06_IDFormatException("아이디는 8자 이상, 20자 이하로 만들어야 합니다.");
		}
		this.userID = userID;
	}
}
