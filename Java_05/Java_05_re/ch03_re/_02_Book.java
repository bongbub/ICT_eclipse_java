package ch03_re;

public class _02_Book {
	
	// 클래스 : 객체에 대한 설계도, 디자인
		//        - 멤버변수(속성) + 멤버메서드(기능, 동작)
		// 객체 : 클래스를 바탕으로 만들어진 힙메모리 공간
		
		
		// 멤버변수(속성)
	
	int bookNo;   // 책 번호
	String bookTitle;   // 책 제목
	String bookAuthor;  // 책 저자
	int bookPrice;      // 책 가격
	float bookScore;    // 책 별점
	
	public void bookInfo() {
		System.out.println("책 번호 :"+bookNo);
		System.out.println("책 제목 :"+bookTitle);
		System.out.println("책 저자 :"+bookAuthor);
		System.out.println("책 가격 :"+bookPrice + "원");
		System.out.println("책 별점 :"+bookScore + "점");
	}

}
