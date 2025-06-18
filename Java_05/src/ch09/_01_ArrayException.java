package ch09;

// 2025. 6. 11 (7교시)

public class _01_ArrayException {
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
		
//		int[] array = new int[5];	// int 형의 배열을 만듦
//		
//		for(int i=0; i <= array.length; i++) {
//			array[i] = i;
//			System.out.println("배열값 :"+array[i]);
//		}
//		System.out.println(" ◈◈◈ 정상 종료 ◈◈◈");
		
		try {// 예외가 발생할 수 있는 코드 부분
			int[] array2 = new int[5];	// int 형의 배열을 만듦
			
			for(int i=0; i <= array2.length; i++) {
				array2[i] = i;
				System.out.println("배열값 :"+array2[i]);
			}
		}
		catch(ArrayIndexOutOfBoundsException e) {// try 블록안에서 예외가 발생했을 때 예외를 처리하는 부분
			System.out.println(" ▒▒▒▒ 예외처리 부분 ▒▒▒▒");
			System.out.println("예외처리 e : \n~> "+ e + "\n");	// java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
			System.out.println("예외처리 메세지 : \n~> "+ e.getMessage() + "\n");	// Index 5 out of bounds for length 5
		}
		finally {
			System.out.println(" ♭♭♭♭♭♭♭♭♭ 항상 출력되는 finally 부분 ♭♭♭♭♭♭♭♭");
			
		}
		System.out.println(" ★★★ 정상 종료! ★★★");
	}

}
