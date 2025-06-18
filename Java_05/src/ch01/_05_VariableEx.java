package ch01;

public class _05_VariableEx {
	public static void main(String[] args) {
		/* p62
		 * 소 -> 대 : 자동 형변환(묵시적 형변환) => 형변환 생략 가능 => 자료 손실이 발생하지 않으므로
		 * 대 -> 소 : 강제 형변환(명시적 형변환) => 형변환 생략 불가 => 자료 손실이 발생하므로
		 * 자료형이 다른 정수끼리 더하면 큰타입으로 자동 형변환된다.
		 * byte형이나 short형은 컴퓨터가 연산을 편리하게 하려고 내부적으로 int형으로 변환한다.
		 */
		
		System.out.println("*** 묵시적 형변환 ***");
		
		double dnum  = 1/3;   // int / int => int => 결과 0.3333333333333333을 (정수나누기 정수는 정수) int로 바꾸니 0 => double 0.0
		System.out.println("dnum : " + dnum);
		
		dnum  = 3/1;   // int / int => int => 결과 3 => double 3.0
		System.out.println("dnum : " + dnum);
		
		
		int iNum = 20;
		float fNum = iNum;
		System.out.println("fNum : " + fNum);  // fNum : 20.0
		
		
		System.out.println();   // 빈줄삽입
		System.out.println("== byte형이나 short형은 int형으로 변환한다. ==");
		
		short sVal = 10;
		byte bVal = 30;
		int result = sVal + bVal;
		System.out.println("result : " + result);   // 40W
		
		System.out.println();   // 빈줄삽입
		
		System.out.println("*** 명시적 형변환 ***");
		double dnum1 = 1.2;
		double fnum1 = 0.09;
		
		int inum1 = (int) (dnum1 + fnum1);   // 1.2 + 0.09 = 1.29 => int로 바꾸니 1
		int inum2 = (int)dnum1 + (int)fnum1;  // 1 + 0
		System.out.println("inum1 : " + inum1);   // 1
		System.out.println("inum2 : " + inum2);   // 1
		
	}

}
