package ch04_re;

public class _06_Sungjuk {

	// 멤버변수
	private int kor;
	private int eng;
	private int math;
	
	// 디폴트생성자
	public _06_Sungjuk() {}

	
	// 매개변수 생성자
	public _06_Sungjuk(int kor2, int eng2, int math2) {
		kor = kor2;
		eng = eng2;
		math = math2;
	}
	
	// getter setter
	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	// 합
	public int getTotal() {
		return kor + eng + math;
	}

	// 평균
	public double getAvg() {
		return getTotal() / 3;
	}

	// 등급
	public char getGrade() {

		if (getAvg() > 100 || getAvg() < 0) {
			return 'W';
			
		} else if (getAvg() < 100 && getAvg() >= 90) {
			return 'A';
		} else if (getAvg() < 90 && getAvg() >= 80) {
			return 'B';
		} else if (getAvg() < 80 && getAvg() >= 60) {
			return 'C';
			
		} else if (getAvg() < 70 && getAvg() >= 50) {
			return 'D';
		} else {
			return 'F';
		}

	}

	public void printInfo() {
		System.out.println("국어 :" + kor);
		System.out.println("영어 :" + eng);
		System.out.println("수학 :" + math);
		System.out.println("합계 :" + getTotal());
		System.out.println("평균 :" + getAvg());
		System.out.println("등급 :" + getGrade());
	}

}
