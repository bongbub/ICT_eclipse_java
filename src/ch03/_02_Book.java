package ch03;

public class _02_Book {
	
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
	int bookNo;         // 책번호
	String bookTitlel;  // 책제목
	String bookAuthor;  // 책 저자
	int bookPrice;      // 책 가격
	
	
	//멤버메서드(기능, 동작)
	public void showInfo(){
		System.out.println("책 번호 : "+ bookNo);
		System.out.println("책 제목 : "+ bookTitlel);
		System.out.println("책 저자 : "+ bookAuthor);
		System.out.println("책 가격 :"+ bookPrice + "원");
	}

}
