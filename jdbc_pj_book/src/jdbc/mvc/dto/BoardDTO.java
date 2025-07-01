package jdbc.mvc.dto;

import java.sql.Date;

public class BoardDTO {

	private int boardNo;			// 글번호
	private String boardTitle;		// 글제목
	private String boardContent;	// 글내용
	private String boardId;			// 작성자
	private Date boardRegDate;		// 작성일
	
	// 디폴트 생성자
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public Date getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardId=" + boardId + ", boardRegDate=" + boardRegDate + "]";
	}
	
	
}
