package ch09_re;

// 2025.6.12 복습

public class _06_IDFormatException extends Exception {
// 사용자정의 Exception 테스트
	// Exception을 상속받아야함!
	
	// 매개변수 생성자
	public _06_IDFormatException(String message) {
		super(message);	// 부모(Exception)의 매개변수 생성자 호출
	}
}
