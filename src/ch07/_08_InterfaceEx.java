package ch07;


// 2025.6.5 (6교시)

public interface _08_InterfaceEx {
	public static void main(String[] args) {
		
		// methodA() 호출
		A08 a = new A08();
		a.methodA();
	}
}

class A08{
	public void methodA() {
		I08 i08 = InstanceManager.getInstance(); //  호출해서 ㄹ턴받는다.
		i08.methodB();
		
	}
}

interface I08{
	public void methodB();		// 추상메서드
}


class B08 implements I08{

	// 디폴트생성자
	public B08() {
		System.out.println("B08 디폴트생성자 호출");
	}
	
	@Override
	public void methodB() {
		System.out.println("B08 클래스 - methodB()");
	}
	
}

class InstanceManager{
	/*
    * 팩토리 메서드(factory method)
    * - 객체를 생성하는 정적 팩토리메서드이다.
    *    이것은 디자인 패턴의 하나로서 객체를 생성하는 부분을 자식클래스에게 위임하는 패턴이다.
    *    즉 new 연산자를 호출하여 객체를 생성하는 코드를 자식클래스에게 위임하는 패턴이다.
    *    사용하는 이유는 하나의 클래스가 변경되었을 경우에 다른 클래스의 변경을 최소화하기 위함이다.
    *    
    *    팩토리 메서드 이름으로 많이 사용하는 것은 getInstance()이다.
    *    인터페이스에서 팩토리 메서드를 제공할 때 정적메서드를 사용하게 된다.
    *    static이므로 클래스명.정적메서드로 접근
    */
	public static I08 getInstance(){	// I08 i08 = new B08
		return new B08();
	}
}