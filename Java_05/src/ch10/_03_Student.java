package ch10;

// 2025.6.13	2교시

// p368
public class _03_Student {
	
	int studentId;
	String studentName;
	
	public _03_Student(int studentId, String studentName) {
		this.studentId = studentId;
		this.studentName = studentName;
	}
	
	@Override
	public String toString() {
		return ("학번 :"+studentId+" 이름 :"+studentName);
	}
	
	
}
