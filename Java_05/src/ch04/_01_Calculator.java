package ch04;

public class _01_Calculator {

	/*
	 * 메서드(함수) : 클래스의 기능 구현 - 입력을 받아 처리 결과를 반환하는 기능 
	 * 1) 메서드 호출시 메서드명이 일치해야 한다. 
	 * 2)매개변수 갯수와 type(자료형)이 일치해야 한다. 
	 * 3) 리턴타입도 일치해야 한다. 단, 변수명은 달라도 무관
	 * 
	 * 문법 : public 반환형 메서드명(매개변수1,..) { return 반환값; // 처리결과를 리턴하며, 반환형과 일치해야 한다. }
	 * 반환형이 void(비어있다는 뜻)으로 선언된 메서드는 결과값을 반환하지 않는다.
	 */

	// 멤버메서드
	public double add(double num1, double num2) {
		return num1 + num2; // 두 수를 더한 값을 반환
	}
	
	// 뺄셈도 하기
	public double sub(double no1, double no2) {
		return no1-no2;   // 두 수를 뺀 값
	}
	
	// 곱셈
	public double mul(double t1, double t2) {
		return t1 * t2;
	}
	
	// 나눗셈
	public double div(double n1, double n2) {
		return n1 / n2;
	}

}
