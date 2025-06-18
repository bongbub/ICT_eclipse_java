package ch08;

import java.util.HashMap;
import java.util.Scanner;

public class _08_loginHashMapEx {
	public static void main(String[] args) {
		
		/* [플젝]
	       * 1. id, pwd 5건을 hashtable에 저장(hashMap에 저장) - put
	       * 2. 콘솔로부터 id, password를 입력받는다.(로그인을 위해)
	       *    1과 2를 비교해서
	       * 3. 아이디가 없으면 "입력하신 아이디가 존재하지 않습니다." 출력
	       *    아이디가 있으면 비밀번호와 비교해서 일치시 "로그인 성공" 출력
	       *                                불일치시 "비밀번호가 불일치" 출력
	       * 4. id입력시 Q나 q를 입력시 종료  :  System.exit(0) // 정상종료, break, return;
	       * 문자열 비교 =>  입력값.equals(비교값)   => if(id.equals("park"))
	       * 패스워드 비교 => pw.equals(map.get(i)
	       * 
	       *  key      value    
	       *  id       password
	       * "park"   "park1234"
	       * "kim"    "kim1234"
	       * "lee"    "lee1234"
	       * "son"    "son1234"
	       * "choi"   "choi1234"
	       */
	      
	      // 1. id, pwd 5건을 hashtable에 저장(hashMap에 저장) - put
		HashMap<String, String> login = new HashMap<String, String>();
		
		login.put("park", "park1234");
		login.put("kim", "kim1234");
		login.put("lee", "lee1234");
		login.put("son", "son1234");
		login.put("choi", "choi1234");
		
		
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			System.out.println("system :  Q 또는 q를 입력하시면 로그인을 종료합니다. ");
			System.out.print("system : 아이디를 입력하세요 :");
			String id = scan.next();
			if(id.equals("q")|| id.equals("Q")) {
				System.exit(0);
			}
			else if(login.containsKey(id)) {
				System.out.println("system : 아이디 일치");
				System.out.print("system : 비밀번호를 입력하세요 :");
				String pw = scan.next();
				if(login.get(id).equals(pw)){
					System.out.println("system : 로그인 성공");
					break;
				}
				else {
					System.out.println("비밀번호 불일치");
					continue;
				}
			}
			else {
				System.out.println("system : 아이디가 일치하지 않습니다. \n");
				continue;
			}
		}
		scan.close();
	}
}
