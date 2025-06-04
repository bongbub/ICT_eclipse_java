package src.ch04_re;

public class _01_Calculator {
	
	// 메서드 (함수) : 클래스의 기능 구현
	// -> 입력을 받아 처리 결과를 반환하는 기능
	// 1. 메서드 호출 시 메서드명이 일치해야한다.
	// 2. 매개변수 갯수와 type(자료형)이 일치해야한다.
	// 3. 리턴타입도 일치해야한ㄷ. 단 변수명은 달라도 된다
	// 문법 : public 반환형 메서드명(매개변수1, 매개변수2...){
	//              return 반환값;  (=> 처리결과)
	// 반환형이 void -> 비어있다는 뜻으로 선언된 메서드는 결과값을 반환하지 않음
	
	
	//덧셈, 뺄셈, 곱셈, 나눗셈
	public double add(double num1, double num2) {
		return num1+num2;
	}
	public double sub(double num3, double num4) {
		return num3-num4;
	}
	public double mul(double num5, double num6) {
		return num5*num6;
	}
	public double div(double num7, double num8) {
		return num7 / num8;
	}

}
