package ch06;

public class _03_Manager extends _03_Employee {
	
	// 2025.6.2
	// 자식클래스
	
	private int bonus;  // 보너스
	
	//_03_Employee em = new _03_Employee("S001", "김태희", "전산실", 100000);
	
	
	// setter getter
	public int getBonus() {
		return bonus;
	}
	public void setBonus(int bonus) {
		this.bonus = bonus;
	}
	
	// 출력
	public void printInfo() {
		super.printInfo();
		System.out.println("-보너스 :" +bonus +"만 원");
		System.out.println("");
		
	}

}
