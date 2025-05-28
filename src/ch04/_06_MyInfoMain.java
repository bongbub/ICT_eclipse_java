package ch04;

public class _06_MyInfoMain {
	
	public static void main(String[] args) {
		
		// 방법1. 디폴트 생성자 + setter
		_06_MyInfo info1 = new _06_MyInfo();
		
		info1.setName("조현빈");
		info1.setAge(25);
		info1.setAddress("경기도 부천시");
		info1.setEmail("dksdkffiwna@naver.com");
		info1.setDream("돈만백");
		
		info1.printInfo();
		
		System.out.println("");
		System.out.println("================");
		System.out.println("");
		
		// 방법2. 매개변수 생성자
		_06_MyInfo info2 = new _06_MyInfo("룰루랄라",12,"경기도 인천시", "fnffnfkffk@gmail.com","개발자");
		
		info2.printInfo();
		 
		
	}

}
