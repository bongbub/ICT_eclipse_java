package jdbc.mvc.service;

public interface BoardService {
	
	public int boardInsert();
	
	
	public int boardUpdate();
	
	public int boardDelete();
	
	public int boardSelectById();
	
	public int boardSelectByTitle();
	
	public int boardSelectAll();

}
