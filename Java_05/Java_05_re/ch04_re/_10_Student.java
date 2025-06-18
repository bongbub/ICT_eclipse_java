package ch04_re;

public class _10_Student {
	
	static int serialNum = 10;
	int studentID;
	String name;
	
	// 디폴생
	public _10_Student() {
		serialNum++;
		studentID = serialNum;
		
	}
	
	// 매변생
	public _10_Student(int studentID, String name) {
		this.studentID = studentID;
		this.name = name;
	}
	
	// getset
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID =  studentID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
