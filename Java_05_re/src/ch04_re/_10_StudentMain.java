package src.ch04_re;

public class _10_StudentMain {
	public static void main(String[] args) {

		_10_Student lee = new _10_Student();
		lee.setName("이지원");
		System.out.println("시리얼넘버: "+ _10_Student.serialNum);
		System.out.println("이름 : "+ lee.name);
		System.out.println("학번 :"+lee.studentID);
		
		System.out.println(" =============== ");
		
		_10_Student kim = new _10_Student();
		kim.setName("김민지");
		System.out.println("시리얼넘버: "+ _10_Student.serialNum);
		System.out.println("이름 : "+ kim.name);
		System.out.println("학번 :"+kim.studentID);
	}

}
