package ch04;

public class _05_PrintEx {

	
	public static void main(String[] args) {
		
		
		   /*
	       * printf(형식지정자, 값 또는 변수)
	       * - 형식지정자 : format
	       *   %d : 정수를 출력한다. 예)System.out.printf("%d", 10);
	       *   %f : 실수를 출력한다. 예)System.out.printf("%f", 3.14f); // 실수6자리
	       *   %c : 한 문자를 출력한다. 예)System.out.printf("%c", 'a');
	       *   %s : 문자열을 출력한다. 예)System.out.printf("%s", "Good Luck");
	       */
		
		
		double value = 1.0 / 3.0;
		System.out.println("value :" + value);
		//value :0.3333333333333333
		
		System.out.printf("value :"+ "%f",value);
		// value :0.333333
		
		
		System.out.println();
		
		
		// printf(%전체자릿수.나머지자릿수, 값 또는 변수);
		// -> 자릿수가 부족하면 공백으로 채운다.
		System.out.printf("value :"+ "%6.2f",value);
		// 6자리 중에서 2자리만 출력하겠다.
		// '  0.33'
		// 앞의 2자리가 공백으로 채워진다.
		
		System.out.println();  
		
		// 공백없이 출력
		System.out.printf("value :"+ "%.2f",value);
		

		// 문자열 출력
		System.out.printf("value :"+ "%s", "Good Luck");
		
		System.out.println();
		// 날짜 출력
		System.out.printf("value :"+ "%s","2025/05/08");
		
		
	}
}
