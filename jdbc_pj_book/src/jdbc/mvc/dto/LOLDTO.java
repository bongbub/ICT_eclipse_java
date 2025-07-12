package jdbc.mvc.dto;

public class LOLDTO {


	private int champId;		// 챔피언번호
	private String champName;	// 챔피언명
	private String qSkill;		// Q스킬
	private String wSkill;		// W스킬
	private String eSkill;		// E스킬
	private String rSkill;		// R스킬
	private String mainLine;	// 주라인
	private String subLine;		// 서브라인
	private double winPc;		// 승률
	
	// 디폴트 생성자
	public LOLDTO() {
	super();
	// TODO Auto-generated constructor stub
	}
	// 매개변수 생성자
	public LOLDTO(int champId, String champName, String qSkill, String wSkill, String eSkill, String rSkill,
			String mainLine, String subLine, double winPc) {
		super();
		this.champId = champId;
		this.champName = champName;
		this.qSkill = qSkill;
		this.wSkill = wSkill;
		this.eSkill = eSkill;
		this.rSkill = rSkill;
		this.mainLine = mainLine;
		this.subLine = subLine;
		this.winPc = winPc;
	}

	// getter setter
	public int getChampId() {
		return champId;
	}

	public void setChampId(int champId) {
		this.champId = champId;
	}

	public String getChampName() {
		return champName;
	}

	public void setChampName(String champName) {
		this.champName = champName;
	}

	public String getqSkill() {
		return qSkill;
	}

	public void setqSkill(String qSkill) {
		this.qSkill = qSkill;
	}

	public String getwSkill() {
		return wSkill;
	}

	public void setwSkill(String wSkill) {
		this.wSkill = wSkill;
	}

	public String geteSkill() {
		return eSkill;
	}

	public void seteSkill(String eSkill) {
		this.eSkill = eSkill;
	}

	public String getrSkill() {
		return rSkill;
	}

	public void setrSkill(String rSkill) {
		this.rSkill = rSkill;
	}

	public String getMainLine() {
		return mainLine;
	}

	public void setMainLine(String mainLine) {
		this.mainLine = mainLine;
	}

	public String getSubLine() {
		return subLine;
	}

	public void setSubLine(String subLine) {
		this.subLine = subLine;
	}

	public double getWinPc() {
		return winPc;
	}

	public void setWinPc(double winPc) {
		this.winPc = winPc;
	}
	// toString()
	@Override
	public String toString() {
		return "LolDTO [champId=" + champId + ", champName=" + champName + ", qSkill=" + qSkill + ", wSkill=" + wSkill
				+ ", eSkill=" + eSkill + ", rSkill=" + rSkill + ", mainLine=" + mainLine + ", subLine=" + subLine
				+ ", winPc=" + winPc + "]";
	}
	
	
}
