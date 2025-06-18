package ch08_re;

import java.util.HashMap;
import java.util.Scanner;

// 2025.6.11 로그인 복습

public class _08_loginHashMapEx {
	public static void main(String[] args) {
		
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("park", "park1234");
		login.put("kim", "kim1234");
		login.put("lee", "lee1234");
		login.put("son", "son1234");
		login.put("choi", "choi1234");
		
		Scanner scan = new Scanner(System.in);
		System.out.println( "~~ 로그인 시스템 ~~");
		while(true) {
			System.out.println(" Q 또는 q를 입력하면 종료하실 수 있습니다.");
			System.out.print("아이디를 입력하시오 : ");
			String id = scan.next();
			if(id.equals("Q") || id.equals("q")) {
				System.exit(0);
			}
			else if(login.containsKey(id)) {
				System.out.print("비밀번호를 입력하시오 :");
				String pw = scan.next();
				if(pw.equals(login.get(id))){
					System.out.println("로그인 성공");
					break;
				}
				else {
					System.out.println("비밀번호가 일치하지 않습니다.");
				}
			}
			else {
				System.out.println("아이디가 일치하지 않습니다.");
				continue;
			}
			
		}
		
		
	}

}
