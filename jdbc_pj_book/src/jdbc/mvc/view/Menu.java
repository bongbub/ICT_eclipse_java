package jdbc.mvc.view;

import java.util.Scanner;

import jdbc.mvc.controller.BoardController;
import jdbc.mvc.controller.BookController;
import jdbc.mvc.controller.LOLController;
import jdbc.mvc.dto.BoardDTO;
import jdbc.mvc.dto.BookDTO;
import jdbc.mvc.dto.LOLDTO;

public class Menu {
	
	// 1. 도서관리  2. 게시판   3.찜한도서      4. 종료
	// 입력을 위한 스캐너
	Scanner scan = new Scanner(System.in);
	// 도서관리 컨트롤러
	BookController bc = new BookController();
	// 게시판 컨트롤러
	BoardController bcon = new BoardController();
	// 리그오브레전드 컨트롤러
	LOLController lol = new LOLController();
		
		
	public void displayMenu() {
		// 메뉴가 계속 선택될 수 있게 while(true) -> break으로 탈출
		while(true) {
			System.out.println("*-------------------------------------------------*");
			System.out.println("    1. 도서관리    2. 게시판    3. 리그오브레전드    4. 종료    ");
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
				lol_menu();
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
			case 1: // 도서추가
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
	
	
	// ------------------------------------------
	// 2. 게시판 메뉴
	public void board_menu() {
		while(true) {
			System.out.println("");
			System.out.println("게시판메뉴 (board_menu)");
			System.out.println("*-------------------------------------------------*");
			System.out.println("    1. 게시글 작성     2.게시글 수정     3. 게시글 삭제    4. 글번호 검색" );
			System.out.println("*-------------------------------------------------*");
			System.out.println("*-------------------------------------------------*");
			System.out.println("    5. 글제목 검색     6.전체글목록 보기     7. 종료"    );
			System.out.println("*-------------------------------------------------*");
			System.out.print("▶ 메뉴선택 : ");
			int menuNo = scan.nextInt();
			scan.nextLine();		// 인풋이 꼬이지 않도록
			
			
			switch(menuNo) {
			case 1: // 게시글 작성
				bcon.boardAdd(writeBoard());
				break;
				
			case 2:
				bcon.boardEdit(boardId(),writeBoard());
				break;
				
			case 3:
				bcon.boardDelete(boardId());
				break;
				
			case 4:
				bcon.boardSelectId(boardId());
				
				break;
				
			case 5:
				bcon.boardSelectTitle(boardTitle());
				break;
				
			case 6:
				bcon.boardSelectAll();
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
	// 게시글 추가메서드
	public BoardDTO writeBoard() {
		BoardDTO dto = new BoardDTO();
		
		int bnum = dto.getBoardNo();
		
		System.out.println("글 제목:");
		String title = scan.nextLine();
		dto.setBoardTitle(title);
		
		System.out.println("작성자 :");
		String author = scan.nextLine();
		dto.setBoardId(author);
		
		System.out.println("내용 : ");
		String content = scan.nextLine();
		dto.setBoardContent(content);
		
		int res = bnum++;
		
		dto.setBoardNo(res);
		
		return dto;
	}
	public int boardId() {
		System.out.println("글번호 입력 : ");
		return Integer.parseInt(scan.nextLine());
	}
	public String boardTitle() {
		System.out.println("글제목 입력 : ");
		return scan.nextLine();
	}
	//------------------------------------------------------------------------------------
	// 3. 찜 메뉴
	public void lol_menu() {
		System.out.println("");
		System.out.println("찜 메뉴 (like_menu)");
		System.out.println("*-------------------------------------------------*");
		System.out.println("    1. 챔피언 검색     2.라인별 검색     3. 전체 챔피언 조회 " );
		System.out.println("*-------------------------------------------------*");
		System.out.println("*-------------------------------------------------*");
		System.out.println("    4. 챔피언 추가     5.챔피언 수정     6. 챔피언 삭제  "    );
		System.out.println("*-------------------------------------------------*");
		System.out.println("*-------------------------------------------------*");
		System.out.println("    7. 메타챔피언추천    8. 챔피언 비교    9. 종료"    );
		System.out.println("*-------------------------------------------------*");
		System.out.print("▶ 메뉴선택 : ");
		int menuNo = scan.nextInt();
		scan.nextLine();
		
		switch(menuNo) {
		case 1:
			lol.selectChamp(champNm());
			break;
		case 2:
			lol.selectLine(champline());
			break;
		case 3:
			lol.allChamp();
			break;
		case 4:
			lol.addChamp(insertChamp());
			break;
		case 5:
			System.out.print("검색할 챔피언의 번호를 입력하세요 :");
			lol.updateChamp(champnum(), insertChamp());
			break;
		case 6:
			System.out.print("삭제할 챔피언의 번호를 입력하세요 :");
			lol.deleteChamp(champnum());
			break;
		case 7:
			lol.metaChampRcmm();
			break;
		case 8:
			lol.compareChamp(champNm(), champNm2());
			break;
			
		case 9:
			System.out.println("이전 메뉴");
			System.out.println("");
			return;
		default :
			System.out.println("메뉴를 다시 선택해주세요.");
		}
		
		}
		public String champNm() {
			System.out.print("챔피언 명을 입력하세요 : ");
			return scan.nextLine();
		}
		public String champNm2() {
			System.out.print("챔피언 명을 입력하세요 : ");
			return scan.nextLine();
		}
		public int champline() {
			System.out.println("*-------------------------------------------------*");
			System.out.println("    1. 탑     2. 정글    3. 미드     4. 원딜    5. 서폿 " );
			System.out.println("*-------------------------------------------------*");
			System.out.print("라인을 입력하세요 : ");
			return Integer.parseInt(scan.nextLine());
		}
		public LOLDTO insertChamp() {
			LOLDTO dto = new LOLDTO();
			System.out.print("챔피언이름 : ");
			dto.setChampName(scan.nextLine());
			System.out.print("Q스킬 : ");
			dto.setqSkill(scan.nextLine());
			System.out.print("W스킬 : ");
			dto.setwSkill(scan.nextLine());
			System.out.print("E스킬 : ");
			dto.seteSkill(scan.nextLine());
			System.out.print("R스킬 : ");
			dto.setrSkill(scan.nextLine());
			System.out.println("주라인 : 1. 탑    2. 정글    3. 미드    4. 원딜    5.서폿");
			System.out.print("번호로 입력하세요.");
			int mline = scan.nextInt();
			String mLine = null;
			switch(mline) {
			case 1:
				mLine = "탑";
				break;
			case 2:
				mLine = "정글";
				break;
			case 3:
				mLine = "미드";
				break;
			case 4:
				mLine = "원딜";
				break;
			case 5:
				mLine = "서폿";
				break;
			}
			dto.setMainLine(mLine);
			System.out.println("서브라인 : 1. 탑    2. 정글    3. 미드    4. 원딜    5.서폿");
			System.out.print("번호로 입력하세요.");
			int sline = scan.nextInt();
			String sLine = null;
			switch(sline) {
			case 1:
				sLine = "탑";
				break;
			case 2:
				sLine = "정글";
				break;
			case 3:
				sLine = "미드";
				break;
			case 4:
				sLine = "원딜";
				break;
			case 5:
				sLine = "서폿";
				break;
			default :
				System.out.println("정확한 번호를 입력해주세요. ");			
			}
			dto.setSubLine(sLine);
			System.out.print("승률을 숫자만 입력하세요 :");
			dto.setWinPc(scan.nextDouble());
			scan.nextLine();
			return dto;
		}
		public int champnum() {
			return Integer.parseInt(scan.nextLine());
		}
	
	
}