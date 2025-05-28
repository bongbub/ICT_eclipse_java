package ch03;

public class _02_BookMain {
	public static void main(String[] args) {
		// 객체(인스턴스) 생성
		// 클래스명 참조변수 = new 클래스명();  //참조변수에 클래스의 주소값
		// 참조변수.멤버변수 = 값;
		// 참조변수.멤버메소드();
		
		
		_02_Book book1 = new _02_Book();
		book1.bookNo = 1001;
		book1.bookTitlel = "java입문";
		book1.bookAuthor = "박은종";
		book1.bookPrice = 25000;
		
		book1.showInfo();
		
		System.out.println("===============");
		
		_02_Book book2 = new _02_Book();
		book2.bookNo = 1002;
		book2.bookTitlel = "jsp";
		book2.bookAuthor = "이재명";
		book2.bookPrice = 15000;
		
		book2.showInfo();
		
		
	}

}
