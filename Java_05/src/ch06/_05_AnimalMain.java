package ch06;

//p268

//2025.6.2 (6교시)

//메인클래스
public class _05_AnimalMain {
	public static void main(String[] args) {

		// 동일한 클래스(같은 클래스) 안에 있는 함수를 호출할 것
		// => new가 필요 없음

		// 단, 현재 호출하는 클래스가 main(static)이고
		// 호출하는 함수는 일반메서드이므로 호출 오류.
		// => 방법1) 아래 함수를 static으로 하던
		// => 방법2) _05_AnimalMain ani = new _05_AnimalMain();
		// 이렇게 해서 해줘야댐

		// _05_Animal animal = new _05_Animal();
		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		//        받는 쪽			 =             받는 쪽
		//                               ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		// public static void moveAnimal(_05_Animal animal){...}
		
		
		// -----> 다형성
		// 부모클래스 참조변수 = new 자식클래스
		

		// moveAnimal(new _05_Animal()); 
		// 실행-> 05_Animal animal = new _05_Animal(); (이렇게 가장 많이 씀)
		moveAnimal(new _05_Animal());   // 부모타입으로 받음
		moveAnimal(new _05_Human());
		moveAnimal(new _05_Tiger());
		moveAnimal(new _05_Eagle());

	}

//	public static void moveAnimal(_05_Human animal) {
	//05_Human human = new _05_Human();
//		animal.move();
//	}
//
//	public static void moveAnimal(_05_Tiger animal) {
	//05_Tiger tiger = new _05_Tiger();
//		animal.move();
//	}
//
//	public static void moveAnimal(_05_Eagle animal) {
	//05_Eagle eagle = new _05_Eagle();
//		animal.move();
//	}		=> 자식클래스 갯수가 많아지면 한도 끝도 없음
	
//          ==> 부모 클래스 하나로 받으면 됨!!
	
	
	// 자식클에만 있는 함수를 호출하기 위해서는!?
	// 부모클에서 접근할 수 없듬
	//  -> 다운캐스팅으로 낮춰서 접근!
	// 만약 받아온 ani가 자식클이라면
	// 부모타입으로 받음!!!!!!!!!!!!!!!!
	// 부모타입의 참조변수를 가진 일반 메서드
	public static void moveAnimal(_05_Animal animal) {
		// animal로 접근할 수 있는건 _05_Animal에 있는 것.
		animal.move();  // _05_Animal에 있는 move()를 호출하겠다.
						// 자료형이 부모클래스 타입이어도 재정의된 자식 메서드가 호출!!!!!!!!!!!!!!!!!!
		
		if(animal instanceof _05_Human) {  // animal이 _05_Human의 객체이면
			_05_Human human = (_05_Human)animal;  // 다운캐스팅
			human.readBook();
		}else if(animal instanceof _05_Tiger) {
			_05_Tiger tiger = (_05_Tiger)animal;  // 다운캐스팅
			tiger.hunting();
		}
		
		
		else if(animal instanceof _05_Eagle) {
			// animal이 _05_Eagle 이면, 
			_05_Eagle eagle = (_05_Eagle)animal;  // 다운캐스팅
			eagle.flying();
		}
		else {
			//System.out.println("Unknown animal type");
		}
	}
}
	
