package ch09;

import java.util.Scanner;

// 2025.6.11	7교시

public class _02_ArithmethicException {
	public static void main(String[] args) {
		
		
		// p523
		/*
	       * [면접]
	       * 예외 처리 목적 : 정상종료
	       * 
	       * try { 
	       *      	// 예외가 발생할 수 있는 코드 부분
	       * } catch(처리할 예외타입 e) {
	       *    	// try 블록안에서 예외가 발생했을 때 예외를 처리하는 부분
	       * } finally {
	       *     	// 항상 수행되는 부분(예외가 발생하지 않더라도) 
	       *   	  	// 주로 자원해제를 위한 close() 문장이 온다.
	       * }
	       * 
	       * 1. 강제예외발생 : throw new Exception(message);
	       * 2. 상위 메서드에게 예외 던지기
	       *    throws Exception
	       * 3. 예외 처리
	       *    catch(던진 Exception e){e.getMaessage()}로 받는다.
	       * 
	       * catch문이 여러개일때(다중 catch) 부모 Exception이 제일 아래오도록 한다. 실행순서는 위에서부터 실행
	       */
		
		
		System.out.println(" ===== 두개의 정수값 입력 =====");
		
		// Scanner 생성
		Scanner scan = new Scanner(System.in);
		
		// 예외가 발생할 수 있는 코드 부분
		System.out.print("첫 번째 값 입력 : ");
		int num1 = scan.nextInt();
		
		System.out.print("두 번째 값 입력 : ");
		int num2 = scan.nextInt();
		
		try {// try 블록안에서 예외가 발생했을 때 예외를 처리하는 부분 => 0으로 나눌 때
			System.out.println("몫 : "+(num1/num2));
			System.out.println("나머지 : "+ (num1 % num2));
		}
		catch(ArithmeticException e) {
			System.out.println(" \n !!!!!!!!!!!!!! 오류 발생 !!!!!!!!!!!!! ");
			System.out.println("오류코드 : "+ e);
			System.out.println("오류메세지 : "+ e.getMessage());
		}
		finally {
			// 항상 수행되는 부분(예외가 발생하지 않더라도) 
		    // 주로 자원해제를 위한 close() 문장이 온다.
			System.out.println("\n항상 출력되는 finally 부분 입니다용 ㅋ");
		}

		
		
		System.out.println( "\n ＠＠＠ 정상종료 ＠＠＠");
		scan.close();
	}
	
	

}
