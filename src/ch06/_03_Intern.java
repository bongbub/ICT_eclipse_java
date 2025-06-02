package ch06;


// 2025.6.2
// 오버라이드 쓰기 위한 내가 만든 예제
public class _03_Intern extends _03_Employee{
	
	private int money;
	
	// 디폴생
	public _03_Intern() {
		super();    // 부모 디폴트 생성자 (생략시 컴파일러가 자동 추가)
		
	}
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	// 부모메서드 똑같이 가져오기
	// -> 부모 메서드를 재정의해서 출력
	// ->main에서 호출시 자식메서드가 호출된다
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("-추가금: "+money);
		
	}

}
