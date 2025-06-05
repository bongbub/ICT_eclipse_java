package ch04_re;

public class _02_BookMain {
	public static void main(String[] args) {
		
		_02_Book book = new _02_Book();

		book.setBookNo(123);
		book.setBookTitle("할로방가");
		book.setBookAuthor("울랄라");


		// 1. printInfo()호출해서 출력
		System.out.println("===== printInfo() =====");
		book.printInfo();

		// 2. getter 사용해서 출력

		_02_Book book2 = new _02_Book();

		System.out.println("\n"+ "=== getter로 출력 ===");
		book2.setBookNo(313);
		book2.setBookTitle("오징어 꼴뚜기");
		book2.setBookAuthor("하이하이");

		System.out.println("책 번호 :" + book2.getBookNo());
		System.out.println("책 이름 :" + book2.getBookTitle());
		System.out.println("책 저자 :" + book2.getBookAuthor());
		
	}

}
