package ch10;

// 2025.6.13	3교신가


public class _02_BookMain {
	public static void main(String[] args) {
		
		_02_Book book = new _02_Book("S001", "너구리의모험","지피티");
		_02_Book book2 = new _02_Book("S002", "바윗돌 깨뜨려 돌맹이","팽희지");
		_02_Book book3 = new _02_Book("S003", "곰세마리가한집에있어 아빠곰엄마곰애기곰","아기곰");
		_02_Book book4 = new _02_Book("S004", "롤하고싶다","카이사");
		
		
		
		System.out.println(book);
		System.out.println(" ------------ ");
		System.out.println(book2);
		System.out.println(" ------------ ");
		System.out.println(book3);
		System.out.println(" ------------ ");
		System.out.println(book4);
		System.out.println(" ------------ ");
	}

}
