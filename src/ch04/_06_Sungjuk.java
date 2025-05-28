package ch04;

public class _06_Sungjuk {


	private int kor;
	private int eng;
	private int math;

	public int getKor(){
		return kor;
	}
	public void setKor(int kor){
		this.kor = kor;
	}

	public int getEng(){
		return eng;
	}
	public void setEng(int eng){
		this.eng = eng;
	}

	public int getMath(){
		return math;
	}
	public void setMath(int math){
		this.math = math;
	}

	public int getTotal(){
		return kor+eng+math;
	}
	public double getAvg(){
		return (kor+eng+math)/3;
	}

	public String getGrade(){
		if(getAvg() > 100 && getAvg() < 0) {
			return "점수 이상";
		}
		else if(getAvg()>=90){
			return "A";
		}
		else if(getAvg() < 90 && getAvg() >= 80){
			return "B";
		}
		else if(getAvg() < 80 && getAvg() >= 70){
			return "C";
		}
		else if(getAvg() < 70 && getAvg() >=60){
			return "D";
		}
		else {
			return "F";
		}
	}

	public void printInfo(){
		System.out.println("국어 :" + kor);
		System.out.println("영어 :" + eng);
		System.out.println("수학 :" + math);
		System.out.println("합계 :" + getTotal());
		System.out.println("평균 :" + getAvg());
		System.out.println("평점 :" + getGrade());
	}
	
	

}
