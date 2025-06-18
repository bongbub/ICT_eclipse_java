package ch09;

import java.util.Scanner;

// 2025.6.12 	2교시

public class _04_ThrowsException {
	
	// main()과 readAge()에서 모두 사용할 Scanner 생성
	static Scanner scan = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		/*
	    * 1. 강제예외발생 : throw new Exception(message);
	    * 2. 상위 메서드에게 예외 던지기
	    *    throws Exception
	    * 3. 예외 처리 : try ~ catch ~ finally
	    *    catch(던진 Exception e){e.getMaessage()}로 받는다.
	    * 
	    * catch문이 여러개일때(다중 catch) 부모 Exception이 제일 아래오도록 한다. 실행순서는 위에서부터 실행
	    */
		
		try {
			int age = readAge();
			System.out.println("나이 :"+age);
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println(e.getMessage());
		}
		finally {
			System.out.println("※※※ finally ※※※");
			scan.close();
		}
		System.out.println("※※※ 정상종료 확인 ※※※");
		
	} // main
	
	// 나이를 음수로 받게 되면 예외 발생
	public static int readAge() throws Exception {		// 2. 상위 메서드에게 예외 던지기
		
		System.out.print("나이를 입력하세요. :");
		
		int age = scan.nextInt();
		if(age < 0) {
			// 1. 강제예외발생 : throw new Exception(message);
			throw new Exception("나이는 0보다 커야합니다. ");
			
		}
		return age;
	}
}
