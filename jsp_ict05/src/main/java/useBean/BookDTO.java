package useBean;

// 2025.6.18	

// DTO(데이터전송객체 : Data Transfer Object)  // 추후 DB테이블 (테이블과 매핑, ~> 멤버변수, 화면input)
public class BookDTO { // 하나의 테이블이 되는 BookDTO -> 화면에서 데이터를 입력받음

	// 멤버변수
	private int bookId; // 도서번호(PK)
	private String title; // 도서명
	private String author; // 저자
	private String publisher; // 출판사
	private int price; // 가격
	private String pubdate; // 출시일

	// 디폴트생성자
	public BookDTO() {
		super();
	}

	// 매개변수생성자
	public BookDTO(int bookId, String title, String author, String publisher, int price, String pubdate) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.pubdate = pubdate;
	}

	// 멤버메서드
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	@Override
	public String toString() {
		return "BookDTO [bookId=" + bookId + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", price=" + price + ", pubdate=" + pubdate + "]";
	}

}
