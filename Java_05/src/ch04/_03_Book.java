package ch04;

public class _03_Book {

	private int bookNo; // 101
	private String bookTitle; // 하얼빈
	private String bookAuthor; // 김훈

	// 생성자 => 멤버변수 초기화
	// 클래스와 똑같이 생긴 메서드
	// 초기화기 때문에 자료형(int,,), void 모두 안 붙임.(퍼블릭도 생략가능)
	// 디폴트 생성자(기본생성자)
	public _03_Book() {
	}

	// 매개변수 생성자
	public _03_Book(int bookNo, String bookTitle, String bookAuthor) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;

	}

	// 멤버메서드
	// getter, setter

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	// printInfo()
	public void printInfo() {
		System.out.println("책 번호 : " + bookNo);
		System.out.println("책 이름 : " + bookTitle);
		System.out.println("책 저자 : " + bookAuthor);
	}

}
