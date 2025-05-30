package ch06;

public class _01_AnimalMain {
	public static void main(String[] args) {
		
		
		// 객체생성
		// Cat
		_01_Cat cat = new _01_Cat();
		
		// setter로 값 전달
		cat.setKind("고양이");
		cat.setLegs(4);
		cat.setWeight(7);
		cat.setCute("뀨");
		
		// printInfo로 출력
		
		cat.printInfo();
		
		
		
		// 객체생성
		// Dog
		_01_Dog dog = new _01_Dog();
		
		// setter로 값 전달
		dog.setKind("강알쥐");
		dog.setLegs(4);
		dog.setWeight(11);
		dog.setStroll("와하하");
		
		// printInfo로 출력
		dog.printInfo();
	}
}
