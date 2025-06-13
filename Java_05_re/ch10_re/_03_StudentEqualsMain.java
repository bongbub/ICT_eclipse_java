package ch10_re;

import ch10._03_Student;

// 20250613 toString(), equals() 재정의

public class _03_StudentEqualsMain {
	
	public static void main(String[] args) {
		
		_03_Student stu1 = new _03_Student(100,"흥부");
		_03_Student stu2 = stu1;
		_03_Student stu3 = new _03_Student(100,"흥부");
		
		System.out.println("stu1 :" + stu1 + "stu2 : "+stu2+"stu3 : "+stu3+"\n");
		if(stu1==stu2) {
			System.out.println("stu1와 stu2의 주소는 같습니다.");
		}else {
			System.out.println("stu1와 stu2의 주소는 다릅니다.");
		}
		if(stu1.equals(stu2)) {
			System.out.println("stu1와 stu2는 동일합니다. ");
		}
		else {
			System.out.println("stu1와 stu2는 동일하지 않습니다.");
		}
		
		if(stu1==stu3) {
			System.out.println("stu1와 stu3의 주소는 같습니다.");
		}else {
			System.out.println("stu1와 stu3의 주소는 다릅니다.");
		}
		if(stu1.equals(stu3)) {
			System.out.println("stu1와 stu3은 동일합니다.");
		}else {
			System.out.println("stu1와 stu3는 동일하지 않습니다.");
		}
		
		System.out.println( " ------- toString() & equals() 재정의 -----------");
		
		// toString(), equals() 재정의했을 때
	
		_03_Human hu1 = new _03_Human(010101-330330,"홍길동");
		_03_Human hu2 = hu1;
		_03_Human hu3 = new _03_Human(010101-330330,"홍길동");
		System.out.println("\nhu1 :" + hu1 + "hu2 : "+hu2+"hu3 : "+hu3+"\n");
		if(hu1==hu2) {
			System.out.println("hu1와 hu2의 주소는 같습니다.");
		}else {
			System.out.println("hu1와 hu2의 주소는 다릅니다.");
		}
		if(hu1.equals(hu2)) {
			System.out.println("hu1와 hu2는 동일합니다. ");
		}
		else {
			System.out.println("hu1와 hu2는 동일하지 않습니다.");
		}
		
		if(hu1==hu3) {
			System.out.println("hu1와 hu3의 주소는 같습니다.");
		}else {
			System.out.println("hu1와 hu3의 주소는 다릅니다.");
		}
		if(hu1.equals(hu3)) {
			System.out.println("hu1와 hu3은 동일합니다.");
		}else {
			System.out.println("hu1와 hu3는 동일하지 않습니다.");
		}
		
	}

}
