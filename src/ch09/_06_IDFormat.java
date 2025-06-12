package ch09;

// p540
// 2025.6.12 	5교시

public class _06_IDFormat {
	
	// 멤버변수
	private String userID;
	
	// getter
	public String getUserId() {
		return userID;
	}
	
	// setter
	public void setUserId(String userId) throws _06_IDFormatException {
		if(userID == null) {
			throw new _06_IDFormatException("아이디는 null일 수 없습니다");
		}
		if(userID.length()<8 || userID.length()>20) {
			throw new _06_IDFormatException("아이디는 8자이상 20자 이하로 쓰시오.");
		}
		this.userID = userID;
	}

}
