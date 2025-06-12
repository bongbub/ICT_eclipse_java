package ch09_re;

// 2025.6.12 복습

public class _06_Main {

	public static void main(String[] args) {
		
		// 생성
		_06_IDFormat format = new _06_IDFormat();
		String userID = null;
		
		
		// 1,2 따로 주석처리하며 테스트
		
		// 1. userID = null 인경우
		try {
			format.setUserID(userID);
			System.out.println("아이디 :"+userID);
		}catch(_06_IDFormatException e) {
			System.out.println("에러 - "+e.getMessage());
		}finally {
			
		}
		System.out.println("정상종료");
		System.out.println("");
		
		// 2. userID != null인경우
		String userID2 = "asdfdf";
		try {
			format.setUserID(userID2);
			System.out.println("아이디 :"+userID2);
		} catch(_06_IDFormatException e) {
			System.out.println("에러 - "+e.getMessage());
		}
		finally {
			
		}
		System.out.println("정상종료");
	}
}
