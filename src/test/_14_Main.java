package test;

import java.util.Scanner;

public class _14_Main {

	public static void main(String[] args) throws Exception {
		
		Scanner scan = new Scanner(System.in);
		_14_PasswordFormat password = new _14_PasswordFormat();
		
		try{
			System.out.print("비밀번호를 입력하세요 .");
			String pw = scan.nextLine();	// next()와 다르게 공백도 인식
			password.setPW(pw);
			System.out.println("입력한 비밀번호를 확인하세요 :"+pw);
			
		} catch (_14_PasswordFormatException e) {
			System.out.println("오류메시지 :" +e.getMessage());
		} catch (Exception e) {
			System.out.println("또다른오류메세지 : "+e.getMessage());
		}
		
		finally {
			scan.close();
		}
			System.out.println("system:시스템 정상종료 확인");
	}
	
	
}
