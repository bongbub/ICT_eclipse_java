package ch02;

public class _11_ForEx {
	public static void main(String[] args) {
		/*
		 * 반복문 : 조건이 참인동안 반복(while문, for문)
		 * 
		 * for(초기값; 조건식; 증감식) {  // 반복횟수
		 *     수행문1;
		 *     수행문2;...
		 * }
		 */
		
		// 출력 => HappyDay1^^   HappyDay2^^  HappyDay3^^  HappyDay4^^  HappyDay5^^
	    //        반복문 종료^^	
		//       ====================
		
		int count=0;
		for(count=1; count<=5; count++) {
			System.out.print("HappyDay" + count + "^^ ");
		}
		System.out.println();
		System.out.println("count : " + count);
		System.out.println("반복문 종료^^");
		System.out.println("====================");
		
		// 출력 => HappyDay5^^   HappyDay4^^  HappyDay3^^  HappyDay2^^  HappyDay1^^
        //        반복문 종료^^	
		for(count=5; count>=1; count--) {
			System.out.print("HappyDay" + count + "^^ ");
		}
		System.out.println();
		System.out.println("count : " + count);
		System.out.println("반복문 종료^^");
		System.out.println("====================");
		
	}
	
}
