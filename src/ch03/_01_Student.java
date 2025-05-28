package ch03;

public class _01_Student {
	
	
	// 클래스에는 '멤버변수'와 '멤버메서드'가 있다.
	
	/*
	 * 클래스 : 객체에 대한 설계도, 디자인
	 *       ㄴ> 1. 멤버변수(속성)
	 *       ㄴ> 2. 멤버메서드 (기능, 동작)
	 * 객체 : 클래스를 바탕으로 만들어진 힙메모리 공간
	 * 
	 */
	
	// 멤버변수(속성)
	// 학번, 이름, 이메일, 주소
	String studentId;   //S0001
	String name;        //홍길동
	String email;
	String address;
	int age;
	int myMoney;
	
	
	
	
	
	// 멤버메서드(기능, 동작)
	// static을 제외하고 작성하기
	public void printInfo() {
		System.out.println("학번 :"+ studentId +"\n" 
				+ "이름 :" + name +"\n"
				+ "이메일 :" + email +"\n"+
				"주소 :" + address + "\n"
				+"나이 :"+age + "\n"
				+"보유자산 :"+ myMoney);
	}
	
}
