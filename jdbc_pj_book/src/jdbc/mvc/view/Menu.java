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
		while(true) {
		System.out.println("");
		System.out.println("도서관리메뉴 (book_menu)");
		System.out.println("*-------------------------------------------------*");
		System.out.println("    1. 추가     2.수정     3. 삭제    4. 도서아이디 조회    5. 도서목록타이틀 조회    6. 전체목록 조회    7. 종료"    );
		System.out.println("*-------------------------------------------------*");
		System.out.print("▶ 메뉴선택 : ");
		
		int menuNo = scan.nextInt();
		scan.nextLine();		// 인풋이 꼬이지 않도록
		
		
			switch(menuNo) {
			case 1: // 도서관리
				bc.bookAdd(bookInput());
				// bookInput => dto의 멤버변수 즉, 멤버변수값을 넣어 넘겨줌
				//bc.bookAdd(new BookDTO("하얼빈","김훈","장비",15000))
				
				break;
				
			case 2:
				//bc.bookedit(bookUpdate());  //내가한방법
				System.out.print("변경 도서 ID 입력 :");
				bc.bookedit2(bookId(),bookInput());    // 쌤이 한 방법
				
				break;
				
			case 3:
				bc.bookDelete(bookId());

				break;
				
			case 4:
				System.out.print("조회 도서 ID 입력 :");
				bc.bookSelectId(bookId());
				break;
				
			case 5:
				bc.bookSelectTitle(bookTitle());
				
				break;
				
			case 6:
				bc.bookSelectAll();
				
				break;
				
			case 7:
				System.out.println(" 프로그램을 종료합니다. ");
				System.out.println();
				return;
			default :
				System.out.println("메뉴를 다시 선택해주세요.");
				
			}
		}

		}
		
	// 1-1. book 추가
	public BookDTO bookInput() {
		
		// 콘솔에서 입력받은 값 -> setter로 BookDTO 멤버변수에 전달됨
		// BookDTO 생성
		BookDTO dto = new BookDTO();
		
		System.out.print("▷도서명 : ");
		String title = scan.nextLine();
		dto.setTitle(title);
		
		System.out.print("▷저자 : ");
		String author = scan.nextLine();
		dto.setAuthor(author);
		
		System.out.print("▷출판사 : ");
		String publisher = scan.nextLine();
		dto.setPublisher(publisher);
		
		System.out.print("▷가격 : ");
		int price = scan.nextInt();
		dto.setPrice(price);
		
		
		return dto;
	}
	
	// 변경할 도서 아이디를 입력받는 메서드
	public int bookId() {
		return Integer.parseInt(scan.nextLine());  //Integer.parseInt -> String을 Int 형으로 변경
	}
	
	// 조회할 도서 제목 받는 메서드
	public String bookTitle() {
		System.out.print("조회할 도서 제목 입력 :");
		return scan.nextLine();
	}
	
	
	public BookDTO bookUpdate() {
		// 콘솔에서 입력받은 값을 통해 어떤 책을 수정할건지 판단
		BookDTO dto = new BookDTO();
		System.out.print("▷정보를 수정할 도서 번호를 입력하세요. :");
		int num = scan.nextInt();
		String skip = scan.nextLine();  //스킵되는거 막기
		dto = bookInput();
		dto.setBookId(num);
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


