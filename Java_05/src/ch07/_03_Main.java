package ch07;

//2025.6.4 (6교시)
//인터페이스

public class _03_Main {
	public static void main(String[] args) {
		
		int num1 = 8;
		int num2 = 4;
		
		// 다형성 적용하여 인스턴스 생성
		_03_Calc cal = new _03_Calculator();
		System.out.printf("%d + %d = %d \n",num1, num2, cal.add(num1, num2));
		System.out.printf("%d - %d = %d \n",num1, num2,cal.substract(num1, num2));
		System.out.printf("%d x %d = %d \n", num1, num2,cal.times(num1, num2));
		System.out.printf("%d / %d = %d \n",num1, num2,cal.divide(num1, num2));
		
		
		
		// cal.showInfo(); 에러나는 이유
		// 다형성 : 부모타입 참조로 자식 객체를 가리키는 것.
		// 힙에는 자식 객체가 올라가지만 참조 타입이 부모면 부모가 아는 것만 쓸 수 있다.
		
		if(cal instanceof _03_Calculator) {
			_03_Calculator cal2 = (_03_Calculator)cal;   // 자식클래스에있는 메서드에 접근하기 위해 다운캐스팅
			cal2.showInfo();
			
			((_03_Calculator) cal).showInfo();
		}
		
	}

}
