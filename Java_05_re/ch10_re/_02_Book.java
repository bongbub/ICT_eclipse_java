package ch10_re;

// 2025.6.13	복습

public class _02_Book {

	// 멤버변수 생성
	private String bookNo;
	private String bookName;
	private String author;
	// 매개변수 생성자
	public _02_Book(String bookNo, String bookName, String author) {
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.author = author;
	}
	
	// toString()
	@Override
	public String toString() {
		return ("이름 : " + bookName + " | 책번호 : "+ bookNo + " | 저자 : "+author);
	}
}
