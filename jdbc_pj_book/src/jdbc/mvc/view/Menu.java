package jdbc.mvc.view;

import java.util.Scanner;

import jdbc.mvc.controller.BookController;
import jdbc.mvc.dto.BookDTO;

public class Menu {
	
	// 1. 도서관리  2. 게시판   3.찜한도서      4. 종료
	// 입력을 위한 스캐너
	Scanner scan = new Scanner(System.in);
	
	BookController bc = new BookController();
		
		
	public void displayMenu() {
		// 메뉴가 계속 선택될 수 있게 while(true) -> break으로 탈출
		while(true) {
			System.out.println("*-------------------------------------------------*");
			System.out.println("    1. 도서관리    2. 게시판    3. 찜한도서    4. 종료    ");
			System.out.println("*-------------------------------------------------*");
			
			System.out.print("▶ 메뉴선택 : ");
			int menuNum = scan.nextInt();
			scan.nextLine();		// 인풋이 꼬이지 않도록
			
			
			switch(menuNum) {
			case 1: // 도서관리
				book_menu();
				break;
			case 2:
				board_menu();
				break;
			case 3:
				like_menu();
				break;
			case 4:
				System.out.println(" 프로그램을 종료합니다. ");
				System.out.println();
				return;
			default :
				System.out.println("시스템을 다시 선택해주세요.");
				
			}
			
			
		}
		
		
	}
	
	
	
	// ----------------------------------------------------------
	// 1. 도서관리 메뉴
	public void book_menu() {
		
		System.out.println("도서관리메뉴 (book_menu)");
		System.out.println("*-------------------------------------------------*");
		System.out.println("    1. 추가    2. 삭제    3. 도서아이디 조회    4. 도서목록 조회    6. 전체목록 조회    7. 종료"    );
		System.out.println("*-------------------------------------------------*");
		System.out.print("▶ 메뉴선택 : ");
		
		int menuNo = scan.nextInt();
		scan.nextLine();		// 인풋이 꼬이지 않도록
		
		
			switch(menuNo) {
			case 1: // 도서관리
				bc.bookAdd(bookInput());
				
				break;
				
			case 2:

				break;
				
			case 3:

				break;
				
			case 4:
				
				break;
				
			case 5:
				
				break;
				
			case 6:
				
				break;
				
			case 7:
				System.out.println(" 프로그램을 종료합니다. ");
				System.out.println();
				return;
			default :
				System.out.println("메뉴를 다시 선택해주세요.");
				
			}
		}
		
	// 1-1. book 추가
	public BookDTO bookInput() {
		
		// 콘솔에서 입력받은 값 -> setter로 BookDTO 멤버변수에 전달됨
		// BookDTO 생성
		BookDTO dto = new BookDTO();
		
		System.out.print("도서명 : ");
		String title = scan.nextLine();
		dto.setTitle(title);
		
		System.out.print("저자 : ");
		String author = scan.nextLine();
		dto.setAuthor(author);
		
		System.out.print("출판사 : ");
		String publisher = scan.nextLine();
		dto.setPublisher(publisher);
		
		System.out.print("가격 : ");
		int price = scan.nextInt();
		dto.setPrice(price);
		
		return dto;
	}
	
	// ------------------------------------------
	// 2. 게시판 메뉴
	public void board_menu() {
		System.out.println("게시판메뉴 (board_menu)");
		
	}
	
	// 3. 찜 메뉴
	public void like_menu() {
		System.out.println("찜 메뉴 (like_menu)");
	}
	
	
	
	
	
	
	
	
	
	
	
	
}


