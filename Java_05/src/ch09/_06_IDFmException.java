package ch09;

// p539
// 2025.6.12	5교시

// 사용자 정의 Exception  =>  Exception을 상속받아야한다.
public class _06_IDFmException extends Exception {

	
	// 매개변수 생성자
	public _06_IDFmException(String message) {
		super(message);		// 부모(=Exception)의 매개변수 생성자 호출
	}
	
}
