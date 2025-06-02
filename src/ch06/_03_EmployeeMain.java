package ch06;

import java.util.Scanner;

public class _03_EmployeeMain {

	// 2025.6.2

	public static void main(String[] args) {
		
		
		// Manager 클래스 생성자
		// 방법1). 디폴트 생성자 + setter로 부모&자식클래스에 값 전달
		_03_Manager man = new _03_Manager();
		
		
		
		 _03_Sawon sawon = new _03_Sawon("S002","박나래","전산실",8000,"02-222-4444","서울시 마포구", 1000);
		 // 방법2) 매개변수 생성자로 값 전달 (자식멤변+부모멤변)
		// -> _09_Sawon 클래스에 그런 매개변수 생성자가 없으므로!
		// _> 하지만 만들어줬으니까 다시 주석 해제 ㅋ
		 // 자식 매개변수생성자 ~> 부모 매개변수생성자 ~> 부모 멤버변수로 이동
		 
		 _03_Intern intern = new _03_Intern();
		
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("정보를 출력할 사원이름 또는 사번을 입력하시오. :");
		String who = scan.next();
		
		// 방법1). 디폴트 생성자 + setter로 부모&자식클래스에 값 전달
		if(who.equals("김태희")||(who.equals("S001"))) {
			// 매니저 셋업
			man.setSabun("S001");
			man.setName("김태희");
			man.setDeptName("전산실");
			man.setSalary(100000);
			man.setTel("02-123-4567");
			man.setAddress("서울시 강남구");
			man.setBonus(2000);
			System.out.println(" --- 매니저 정보 ---");
			man.printInfo();
		}
		else if(who.equals("박나래")||(who.equals("S002"))) {
			// 사원 셋업
//			sawon.setSabun("S002");
//			sawon.setName("박나래");
//			sawon.setDeptName("전산실");
//			sawon.setSalary(8000);
//			sawon.setSudang(1000);
			System.out.println(" --- 사원 정보 ---");
			sawon.printInfo();
			System.out.println("");
		}
		else if(who.equals("김미미")||(who.equals("S003"))) {
			 intern.setSabun("S003");
			 intern.setName("김미미");
			 intern.setDeptName("전산실");
			 intern.setTel("010-8787-1234");
			 intern.setAddress("서울시 강남구");
			 intern.setSalary(6000);
			 
			 intern.setMoney(800);
			 
			 intern.printInfo();
		}
		else {
			System.out.println("사원명 또는 사번이 잘못 입력되었습니다.");
		}
		scan.close();

	}
	
}
