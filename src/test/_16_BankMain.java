package test;

// 2025.6.14	아침테스트 싱글톤예제

public class _16_BankMain {
	public static void main(String[] args) {
		
		_16_Bank instance1 = _16_Bank.getInstance();
		_16_Bank instance2 = _16_Bank.getInstance();
		
		instance1.setInstance("박나래", "우리은행", 10000);
		System.out.println(instance1.toString());
		
		instance1.deposit(5000);
		instance1.withdraw(3000);
		instance1.makeInterest();
		System.out.println(instance1.toString());
		System.out.println("--------------");
		
		instance2.setInstance("유느님", "신한은행", 20000);
		System.out.println(instance2.toString());
		instance2.deposit(5000);
		instance2.withdraw(3000);
		instance2.makeInterest();
		System.out.println("--------------");
		System.out.println(instance2.toString());
		
		
	}

}
