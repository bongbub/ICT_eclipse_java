package ch03_re;

public class _02_BookMain {
	
	public static void main(String[] args) {
		
		_02_Book bk1 = new _02_Book();
		
		bk1.bookNo = 1001;
		bk1.bookTitle = "신데렐라와 일곱난쟁이";
		bk1.bookAuthor = "박미미";
		bk1.bookPrice = 14000;
		bk1.bookScore = 2.4f;
		
		bk1.bookInfo();
		
		
		System.out.println("====================");
		
		
		_02_Book bk2 = new _02_Book();
		
		bk2.bookNo = 1002;
		bk2.bookTitle = "고구마말랭이먹고싶다";
		bk2.bookAuthor = "고구마";
		bk2.bookPrice = 15000;
		bk2.bookScore = 4.6f;
		
		bk2.bookInfo();
	}

}
