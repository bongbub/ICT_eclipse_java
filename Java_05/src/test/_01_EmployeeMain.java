package test;

import java.util.Scanner;

public class _01_EmployeeMain {

	// 2025.6.2

	public static void main(String[] args) {
		
		
		// Manager 클래스 생성자
		_02_Manager man = new _02_Manager();
		
		
		
		 _02_Sawon sawon = new _02_Sawon("S002","박나래","전산실",8000, 1000);
		// 이렇게 작성하면 안되는 이유
		// -> _09_Sawon 클래스에 그런 매개변수 생성자가 없으므로!
		// _> 하지만 만들어줬으니까 다시 주석 해제 ㅋ 그리고 아래 주석 ㅋ
		// Sawon 클래스 생성자
		// _09_Sawon sawon = new _09_Sawon();
		
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("정보를 출력할 사원이름 또는 사번을 입력하시오. :");
		String who = scan.next();
		
		if(who.equals("김태희")||(who.equals("S001"))) {
			// 매니저 셋업
			man.setSabun("S001");
			man.setName("김태희");
			man.setDeptName("전산실");
			man.setSalary(100000);
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
		else {
			System.out.println("사원명 또는 사번이 잘못 입력되었습니다.");
		}
		scan.close();

	}
	
}
