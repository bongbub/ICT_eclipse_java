package src.ch04_re;

public class _05_PrintEx {
	
	public static void main(String[] args) {
		
		
		// printf(형식지정자, 값 or 변수);
		
		double value = 1.0 / 3.0;
		System.out.println("값 :"+value);
		// 0.333333333...
		// 소수점이 많이나옴
		// println
		
		System.out.printf("값 :"+"%f",value);
		//printf
		System.out.println("");
		
		
		// printf(%전체자릿수.나머지자릿수, 값 or 변수);
		System.out.printf("값 :" + "%7.2f",value);
		// 나머지 자리가 공백으로 채워짐
		// 앞의 4자리 공백
		System.out.println("");
		
		
		System.out.printf("%s", "문자열String 출력 %s");
		System.out.println("");
		
		System.out.printf("%c", 'c');
		System.out.println("");
	}
	
	

}
