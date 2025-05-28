package ch02;

public class _03_IfEx {
	public static void main(String[] args) {
		/*
		  [if - else if - else문]
		  
		  if(조건식1) {	// 조건식1이 참인 경우 수행문1을 실행
		  	수행문1;
		  }
		  else if(조건식2) {  // 조건식2이 참인 경우 수행문2을 실행
		  	수행문2;
		  }	
		  else if(조건식3) {  // 조건식3이 참인 경우 수행문3을 실행
		  	수행문3;
		  }	
		  else {			// 위의 조건이 모두 해당되지 않는 경우 수행문4를 실행
		  	수행문4;
		  }
		  
		  수행문5;   // 무조건 실행
		 */
		
		// score가 60점 이상이면 result에 합격, 40점 이상이면 result에 불합격(40~59), 40점 미만이면 result에 과락(39~0)
		// 예시 >  70점 : 합격
		
		int score = 90;
		String result = "";
		
        if(score >= 60) {	
		    result = "합격";
	    }
	    else if(score >= 40) {  
	    	result = "불합격";
	    }	
		else {			
			result = "과락";
		}
        System.out.println(score + "점 : " + result);
		
	    System.out.println("<<< 3항연산자 >>>");
	    // 결과 = 조건식 ? 참  : 거짓;
	    // 결과 = 조건식 ? 참  : ( 조건식 ? 참 : 거짓 );
	    result = (score >= 60) ? "합격" : ( (score >= 40) ? "불합격" : "과락" );
	    System.out.println(score + "점 : " + result);
	}
	
}
