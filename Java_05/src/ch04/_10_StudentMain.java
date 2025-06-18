package ch04;

public class _10_StudentMain {
	public static void main(String[] args) {
		
		// 디폴트 생성자 호출
		/*
		_10_Student lee = new _10_Student(); // serialNum 1증가, 해당 값이 studentID에 대입
		lee.setName("이지원");
		System.out.println("serialNum : "+ lee.serialNum);
		System.out.println("이름 :"+ lee.getName());
		System.out.println("학번 :"+ lee.getStudentID());
		
		
		System.out.println("---------------");
		_10_Student son = new _10_Student(); // serialNum 1증가, 해당 값이 studentID에 대입
		son.setName("손수경");
		System.out.println("serialNum : "+ son.serialNum);
		System.out.println("이름 :"+ son.getName());
		System.out.println("학번 :"+ son.getStudentID());
		*/
		// 위는 출력해도 이지원과 손수경의 학번이 1001로 동일.
		// static 변수를 사용해서 serialNum 변수를 공유하여
		// 학생수가 증가하면 시리얼넘도 증가할 수 있도록 변경
		
		
		
		_10_Student lee = new _10_Student(); // serialNum 1증가, 해당 값이 studentID에 대입
		lee.setName("이지원");
		// static 변수는 클래스명.변수명 으로 접근한다!!!!!!!!!!!!!!!
		System.out.println("serialNum : "+ _10_Student.serialNum);
		System.out.println("이름 :"+ lee.getName());
		System.out.println("학번 :"+ lee.getStudentID());
		
		
		System.out.println("---------------");
		_10_Student son = new _10_Student(); // serialNum 1증가, 해당 값이 studentID에 대입
		son.setName("손수경");
		System.out.println("serialNum : "+ _10_Student.serialNum);
		System.out.println("이름 :"+ son.getName());
		System.out.println("학번 :"+ son.getStudentID());
		
	}

}
