package ch07;

// 2025.6.5 (4교시)
// 인터페이스 마지막 예제

public class _06_ClassEx {
	public static void main(String[] args) {

		// call by reference -> 매개변수로 주소값 전달
		// 매개변수를 통한 주소값 전달

		First f = new First();
		Second s = new Second();
		Third t = new Third();

		f.method1(s, t);

	}
}

class First {
	public void method1(Second sec, Third thi) { // 참조변수로 Second()를 받음
		System.out.println("First 클래스 - method1()");
		System.out.println("물귀신 작전");
		sec.method2(thi); // 참조변수 내의 method2 호출
	}

}

class Second {
	public void method2(Third thi) {
		System.out.println("Second 클래스 - method2()");
		thi.method3();
	}
}

class Third {
	public void method3() {
		System.out.println("Third 클래스 - method3()");
	}

}