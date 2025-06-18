package ch03_re;

public class _01_Student {
	
	// 클래스 : 객체에 대한 설계도, 디자인
	//        - 멤버변수(속성) + 멤버메서드(기능, 동작)
	// 객체 : 클래스를 바탕으로 만들어진 힙메모리 공간
	
	
	// 멤버변수(속성)
	String studentId;   // 아이디
	String name;        // 이름
	String email;       // 이메일
	String addr;        // 주소
	int age;            // 나이
	int money;          // 보유자산

	public void playerInfo() {
		System.out.println(
				"아이디 :"+studentId+"\n"
				+"이름 :"+name+"\n"
				+"이메일 : "+email+"\n"
				+"주소 :"+ addr+ "\n"
				+"나이 :" + age + "\n"
				+"보유자산 : "+money + "\n");
	}
}
