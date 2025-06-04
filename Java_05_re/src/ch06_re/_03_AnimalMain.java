package src.ch06_re;

public class _03_AnimalMain {
	
	public static void main(String[] args) {

		 
		// ani = new (자식클래스)
		everyAnimal(new _03_Animal());  // Animal에 있는 move 출력할라공
		everyAnimal(new _03_Human());
		everyAnimal(new _03_Eagle());
		everyAnimal(new _03_Tiger());
		
		
		//_05_Animal ani = new _05_Human();
		// 사실 이렇게 더 많이 씀
		
		
	}
	
	
	// _03_Animal 클래스를 객체로 받아오는 everyAnimal함수 만듦
	// 부모클래스를 가져왔으니 자식클도 
	// main에서 호출해주기 위해 static으로 선언
	public static void everyAnimal(_03_Animal ani) {
		ani.move();  // _05_Animal에 있는 move함수 출력
		
		
		// 자식클에만 있는 함수를 호출하기 위해서는!?
		// 부모클에서 접근할 수 없듬
		//  -> 다운캐스팅으로 낮춰서 접근!
		// 만약 받아온 ani가 자식클이라면
		if(ani instanceof _03_Human) {
			_03_Human hu = (_03_Human)ani;
			// 다운캐스팅 후 Human 내의 함수 호출
			hu.voice();
			
		}
		else if(ani instanceof _03_Tiger) {
			_03_Tiger ti = (_03_Tiger)ani;
			ti.nyam();
		}
		else if(ani instanceof _03_Eagle) {
			_03_Eagle ea = (_03_Eagle)ani;
			ea.wind();
		}
		// else 생략가능
	}

}
