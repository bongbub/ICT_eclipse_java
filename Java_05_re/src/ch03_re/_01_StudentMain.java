package src.ch03_re;

public class _01_StudentMain {
	
	public static void main(String[] args) {
		
		// 객체(인스턴스) 생성
		//클래스며 참조변수 = new 생성ㅈ
		//  == 클래스명 참조변수 = new 클래스명();
		// '참조변수'에 접근하기 위해 필요한 주소값이 들어있다.
		
		// 참조 클래스의 멤버변수에 접근하기 위해
		// 참조변수.멤버변수 = 값;
		// 참조변수.멤버메서드();
		
		_01_Student st1 = new _01_Student();
		
		st1.studentId = "S100";
		st1.name = "김미미";
		st1.email = "asdf@gmail.com";
		st1.addr = "어딘가";
		st1.age = 12;
		st1.money = 10000;
		
		st1.playerInfo();
		
		
		System.out.println("-------------");
		
		_01_Student st2 = new _01_Student();
		
		st2.studentId = "S200";
		st2.name = "김동동";
		st2.email = "fkffkfk@gmail.com";
		st2.addr = "협곡";
		st2.age = 41;
		st2.money = 191848;
		
		st2.playerInfo();
	}
	
	
	

}
