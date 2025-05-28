package ch03;

public class _01_StudentMain {
	public static void main(String[] args) {
		
		// 객체(인스턴스) 생성
		// 클래스명 참조변수 = new 생성자
		//  == 클래스명 참조변수 = new 클래스명();
		// '참조변수'에 접근하기 위해 필요한 주소값이 들어있다.
		
		
		// 참조클래스의 멤버변수에 접근하기 위해
		// 참조변수.멤버변수 = 값;
		// 참조변수.멤버메서드();
		
		
		_01_Student stdIf = new _01_Student();
		stdIf.studentId =  "S001";
		stdIf.name = "홍길동구리";
		stdIf.email = "qwer@naver.com";
		stdIf.address = "경기도 땡땡시 똥땡띵";
		stdIf.age = 23;
		stdIf.myMoney = 1919;
		
		stdIf.printInfo();
		
//		System.out.println("학번:"+ StdInfo.studentId 
//				+"\n" + "이름 :"+ StdInfo.name
//				+"\n"+"이메일 :" + StdInfo.email
//				+ "\n" + "주소 : "+StdInfo.address);
//		
		System.out.println("---------------------");
		_01_Student stdIf2 = new _01_Student();
		stdIf2.studentId = "S0002";
		stdIf2.name = "세종대왕";
		stdIf2.email = "ㄱㄴㄷㄹ@naver.com";
		stdIf2.address = "대한민국";
		stdIf2.age = 22;
		stdIf2.myMoney = 23992;
		
		stdIf2.printInfo();
		
		
		
		
	}

}
