package ch01;

// p59
public class _04_VariableEx {
	public static void main(String[] args) {
		/*
	       * 상수 : 프로그램이 실행되는 동안, 값이 변하지 않는 수 또는 변경불가능한 수
	       *       주로 대문자 사용(변수는 소문자)
	       *       만약 값을 변경해야 할 경우, 상수를 선언한 곳의 초기값만 변경하면 된다.
	       *       
	       * 문법 : final 자료형 변수명;    예) final double PI = 3.14;
	       *       1) 변수(상수) : 변수의 값 변경불가
	       *      2) 메서드 : 재정의 불가
	       *      3) 클래스 : 상속 불가
	       */
		final int MAX_NUM = 100;
		System.out.println("MAX_NUM : " + MAX_NUM);
		
		// MAX_NUM = 50; // => 문법오류 발생, 상수는 값을 변경불가 
		
		String name = "홍길동";
		System.out.println("이름 : " + name);
		
		name = "소지섭";
		System.out.println("이름 : " + name);
		
		System.out.println("-------------------");
		
		// 상수로 내정보 출력(MY_NAMW, MY_AGE, MY_ASSET, MY_EMAIL)
		
		
	}
}
