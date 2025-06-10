package test;

public class _13_Main {
	
	public static void main(String[] args) {
		
		// 매개변수 생성자로 값 전달
		_13_BookArrayList book = new _13_BookArrayList();
		_13_Book ha = new _13_Book(101,"하얼빈","김훈",16000);
		_13_Book don = new _13_Book(102,"돈의속성","김승호",16020);
		_13_Book dan = new _13_Book(103,"단 한번의 삶","김영하",15120);
		_13_Book mo = new _13_Book(104,"모순","양귀자",11700);
		_13_Book so = new _13_Book(105,"소년이 온다","한강",13500);
		
		book.insertBook(ha);
		book.insertBook(don);
		book.insertBook(dan);
		book.insertBook(mo);
		book.insertBook(so);

		// 출력
		book.showAllBook();
		
		
		System.out.println(" -------제거 후 출력------- ");
		
		// 제거 후 출력
		book.removeBook(103);
		book.showAllBook();
		
		
		// 
		
	}

}
