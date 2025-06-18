package ch10_re;

// 2025.6.13	복습
// p375 clone()예제

class Point {
	int x;
	int y;
	
	Point(int x, int y){	// 매개변수생성자
		this.x = x;
		this.y = y;
	}
	public String toString() {
		return "x = "+x+"," +"y = "+y;
	}
}

class Circle implements Cloneable {
	Point point;		// Point클래스받아옴
	int radius;
	
	Circle (int x, int y, int radius){
		this.radius = radius;
		point = new Point(x,y);	 //point에서 new로 xy값 전달
	}
	@Override
	public String toString() {
		return "원점은 "+point+"이고, " + "반지름은 "+radius +"입니다.";
	}
	// clone()에서 발생할 수 있는 오류를 예외처리
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
		// super => 인터페이스 Cloneable
	}
}

public class _04_Clone {
	public static void main(String[] args) throws CloneNotSupportedException {
		Circle circle = new Circle(10,20,30);	// 23행 호출
		Circle copycircle = (Circle)circle.clone();	// clone()메서드로 circle인스턴스 복제
									// 여기서 에러발생할수도 있어서 throws로 JVM에 떠넘김
		
		System.out.println(circle);
		System.out.println(copycircle);
		System.out.println(System.identityHashCode(circle));
		System.out.println(System.identityHashCode(copycircle));
	}

}
