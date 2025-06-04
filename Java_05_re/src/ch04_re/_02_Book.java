package src.ch04_re;

public class _02_Book {
	
	

	private int bookNo;
	private String bookTitle;
	private String bookAuthor;


	// getter setter
	public int getBookNo(){
		return bookNo;
	}
	public void setBookNo(int bookNo){
		this.bookNo = bookNo;
	}

	public String getBookTitle(){
		return bookTitle;
	}
	public void setBookTitle(String bookTitle){
		this.bookTitle = bookTitle;
	}

	public String getBookAuthor(){
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor){
		this.bookAuthor = bookAuthor;
	}

	public void printInfo(){
		System.out.println("책 번호 : " + bookNo);
		System.out.println("책 이름 : " + bookTitle);
		System.out.println("책 저자 : " + bookAuthor);
	}
}
