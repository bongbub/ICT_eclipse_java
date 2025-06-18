package ch07;

//2025.6.4 (6교시)
//인터페이스

// 자식클래스
// 자식클래스   구현하다(implements)   인터페이스를
public class _03_Calculator implements _03_Calc {

	@Override
	public int add(int num1, int num2) {
		return num1 + num2;  // 부모 추상메서드 -> 재정의된 자식메서드 
		
	}

	@Override
	public int substract(int num1, int num2) {
		return num1 - num2;
	}

	@Override
	public int times(int num1, int num2) {
		return num1 * num2;
	}

	@Override
	public int divide(int num1, int num2) {
		if (num2 != 0) {
			return num1/num2;
		}
		else {
			return _03_Calc.ERROR;
		}
	}
	
	public void showInfo() {
		System.out.println("Calc Interface 구현 ~~~~~~~~! 티비");
	}
	
	
}
