package ch01;

public class _01_VariableEx {
	public static void main(String[] args) {
		/* 가상머신(JVM, Java Virtual Machine)이 프로그램을 시작하기 위해 호출하는 메서드 
		 */
		// https://docs.oracle.com/javase/8/docs/api/
		
		System.out.println("*** 변수 ***");
		System.out.println("변수 : 하나의 값을 저장할 수 있는 메모리 공간");
		
		/*
		 * 변수 선언 및 대입 =>  자료형 변수명 = 값;
		 * 변수는 소문자로 시작한다.
		 * 해당 자료형에 맞게 대입되어야 한다.
		 */
		System.out.println("*** 나의 정보 ***");
		
		String name = "조현빈";
		System.out.println("이름 : " + name);
	
		int age = 25;
		System.out.println("나이 : " + age);
		
		int myMoney = 99999;
		System.out.println("용돈 : " + myMoney);
		
		long salary = 10000000000L;
		System.out.println("급여 : " + salary);
		
		// 주소(address)
		
		// 꿈(dream)
		
		// 선호도(favorateType) : A B C D E
		char favorateType = 'A';
		
		// 성별(gender) : F M
		
		// \t => 탭     \n => 줄바꿈
		System.out.println("이름 : " + name + "\t나이 : " + age + "\t급여 : " + salary);
		System.out.println("이름 : " + name);
		
	}  // main
    

}  // class
