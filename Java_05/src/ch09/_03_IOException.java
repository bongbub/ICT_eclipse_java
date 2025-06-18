package ch09;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

//2025.6.12	 1교시

// Input Output Exception
public class _03_IOException {
	public static void main(String[] args) throws IOException {		// throws -> 부모(JVM - 상위호출)에게 예외처리를 미룬다.
		// file을 읽어오기 위해 필요한 자바클래스 FileInputStream
		FileInputStream fis = null;	// null로 초기화해줘야함
		
		try {
			fis = new FileInputStream("test.txt");	// 1). try catch 선택
		} catch (FileNotFoundException e) {
			// e.printStackTrace();
			System.out.println("메시지 : "+e.getMessage());	//test.txt (지정된 파일을 찾을 수 없습니다.)
		}
		finally {
			if(fis != null){	// 생략시 NullPointException 발생 => 주소값이 없는 NULL상태
			fis.close();		// 2). throws IOException 선택
			}
			System.out.println("<<< finally >>> ");
		}
		System.out.println("<<< 정상종료 >>>");
		
	}
//	메시지 : D:\DEV05\filetest.txt (지정된 파일을 찾을 수 없습니다)
//	<<< finally >>> 
//	<<< 정상종료 >>>
	
}

