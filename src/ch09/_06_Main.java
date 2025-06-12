package ch09;

// p540
// 2025.6.12	5교시

public class _06_Main {
	public static void main(String[] args) {

		_06_IDFormat format = new _06_IDFormat();
		String userID = null;

		// 1, 2 따로 주석처리 하며 테스트
		// 1.userID = null 인 경우
		try {
			format.setUserId(userID);
			System.out.println("아이디 :" + userID);
		} catch (_06_IDFormatException e) {
			System.out.println(e.getMessage());
		} finally {

		}

		// 2.userID != null 인 경우
//		String userID = 1234567;
//		try {
//			format.setUserId(userID);
//			System.out.println("아이디 :" + userID);
//		} catch (_06_IDFormatException e) {
//			System.out.println(e.getMessage());
//		} finally {
//
//		}
	}
}
