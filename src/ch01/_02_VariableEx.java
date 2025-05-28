package ch01;

public class _02_VariableEx {
	public static void main(String[] args) {
		/*
		 * 1. 기본자료형(Primitive Type) : 실제 '값'이 저장되는 공간
		 * 	  - 정수형 : byte(1바이트) ->  short(2바이트) -> int(4바이트): 기본 -> long(8바이트)
		 *    - 실수형 : float(4바이트) -> double(8바이트): 기본
		 *    - 문자형 : char(2바이트)
		 *    - 부울형 : boolean(1바이트) -> 1(true)  /  0(false) => 조건문에서 참인지 거짓인지 판단
		 * 
		 * 2. 참조형(Reference Type) : 실제 객체를 가리키는 주소값이 저장되는 공간 - 참조변수의 자료형
		 *    - 클래스, 인터페이스, 배열
		 *   
		 * 3. 문자열 : String 클래스  
		 */
		System.out.println("=== 정수형 변수 ===");
		// 선언과 동시에 초기화
		int num1  = 10;	// int형은 기본형
		long num2 = 12345678900L;  // long형은 숫자뒤에 L이나 l을 붙인다. int와 구분
		System.out.println("num1 : " + num1); 
		System.out.println("num2 : " + num2); 
		
		System.out.println("=== 실수형 변수 ===");
		float fnum1 = 3.14F;	// float형은 숫자뒤에 F나 f를 붙인다. double형과 구분
		double dnum1 = 5.5;     // double형은 기본형
		System.out.println("fnum1 : " + fnum1); 
		System.out.println("dnum1 : " + dnum1); 
		
		System.out.println("=== 문자형 변수 ===");
		// String은 클래스타입이므로 반드시 대문자로 시작한다. 최기화시 쌍따옴표를 사용하며, 공백이 없어도 된다.
		// String str = "";
		String str = "김태희";
		System.out.println("str : " + str); 
		
		// char grade = ' ';  // char형은 초기화시 ' '를 사용하며, 공백이 있어야 한다.
		char grade = 'A';
		System.out.println(grade); 
		
		System.out.println("=== 부울형 변수 ===");
		boolean isMarried = true;	// 참, 1이라는 값을 가지고 있음
		boolean isWorker = false;	// 거짓, 0이라는 값을 가지고 있음
		System.out.println("isMarried : " + isMarried); 
		System.out.println("isWorker : " + isWorker); 

/*
=== 정수형 변수 ===
num1 : 10
num2 : 12345678900
=== 실수형 변수 ===
fnum1 : 3.14
dnum1 : 5.5
=== 문자형 변수 ===
str : 김태희
A
=== 부울형 변수 ===
isMarried : true
isWorker : false
*/
	}
}
