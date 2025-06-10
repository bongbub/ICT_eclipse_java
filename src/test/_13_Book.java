package test;

// 2025.6.10 	아침 테스트

public class _13_Book {
	

	private int bookNo;
	private String title;
	private String author;
	private int price;

	// 디폴트 생성자
	public _13_Book(){
	}

	// 매개변수 생성자
	public _13_Book(int bookNo, String title, String author, int price){
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.price = price;
	}
	
	// getter setter
	public int getBookNo(){
		return bookNo;
	}
	public void setBookNo(int bookNo){
		this.bookNo = bookNo;
	}
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public String getAuthor(){
		return author;
	}
	public void setAuthor(String author){
		this.author = author;
	}
	public int getPrice(){
		return price;
	}
	public void setPrice(int price){
		this.price = price;
	}


	// toString()
	@Override
	public String toString(){
		return "도서번호 : "+bookNo+"도서명 :" + title + " 저자명 : "+author+"가격 :"+price;
	}
}
