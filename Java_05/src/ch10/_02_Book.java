package ch10;

//2025.6.13	3교시?

public class _02_Book {

	private String bookNo;
	private String bookName;
	private String author;

	_02_Book(String bookNo, String bookName, String author) {
		this.bookNo = bookNo;
		this.bookName = bookName;
		this.author = author;
	}

	@Override
	public String toString() {
		return ("책번호 :" + bookNo + "\n책이름 :" + bookName + "\n책저자 :" + author);
	}

}
