package ch09_re;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

// 2025.6.12	 복습

public class _03_IOException {

	public static void main(String[] args) throws IOException {
		
		// FileInputStream
		FileInputStream file = null;	// file은 초기화 해줘야함

		// 1. try - catch 문 선택
		try {
			file = new FileInputStream("text.txt");
		}
		catch (FileNotFoundException e) {
			System.out.println("에러메세지 : "+e);
		}
		finally {
			// 꼭 써줘야하는 finally 구문
			// 만약 파일이 null이 아니라면 FileInputStream 클로스
			if(file != null) {
				file.close();	// 입출력 예외는 throws로 처리
			}
			System.out.println("finally구문 출력 완료");
		}
		System.out.println("정상 종료 확인");
	}
}
