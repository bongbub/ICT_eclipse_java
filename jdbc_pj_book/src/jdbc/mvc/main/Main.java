package jdbc.mvc.main;


import jdbc.mvc.view.Menu;

public class Main {
	public static void main(String[] args) {
		
		Menu menu = new Menu();	// 패키지가 다르므로 에러가 남 -> import 해주면 ㄱㅊ
		menu.displayMenu();
		
		
	}

}