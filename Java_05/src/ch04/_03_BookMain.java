package ch04;

public class _03_BookMain {
	public static void main(String[] args) {

		System.out.println("--- 방법 1 디폴트 생성자+setter로 값 출력 ---");

		// 디폴트 생성자 호출하여 객체 생성
		_03_Book book = new _03_Book();

		book.setBookNo(101);
		book.setBookAuthor("김훈");
		book.setBookTitle("하얼빈");

		// printInfo()를 통해 book 정보 호출
		System.out.println("=== printInfo() ===");
		book.printInfo();

		System.out.println(" --- 방법 2 매개변수 생성자로 값 전달 ---");

		_03_Book book2 = new _03_Book(102, "jsp", "장나라");

		book2.printInfo();
		System.out.println("");

		// 102 getter 구현 - book정보 출력
		book.setBookNo(102);
		book.setBookTitle("하얼빈2");
		book.setBookAuthor("김훈2");

		System.out.println("=== getter로 직접 가져오기 ===");

		System.out.println("책 번호 : " + book.getBookNo());
		System.out.println("책 제목 : " + book.getBookTitle());
		System.out.println("책 저자 :" + book.getBookAuthor());

	}

}
