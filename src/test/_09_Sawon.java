package test;

public class _09_Sawon extends _09_Employee{
	
	// 2025.6.2
	// 자식 클래스
	
	private int sudang;   // 수당
	
//	_09_Employee em = new _09_Employee("S002", "박나래", "전산실", 8000);
	// 해당 코드가 필요 없는 이유
	// -> 이미 extends 되어 있으므로 부모 클래스의 멤버변수들을 포함하고 있음
	// => 즉, sawon.setSabun...이런 식으로 접근할 수 있음
	// 위의 코드를 작성하면 완전히 별개의 인스턴스가 생기는 것
	
	// 때문에 Main에서 set(...) 의 세터를 사용하지 않고 정보를 세팅하려면
	// 이 클래스에서 생성자를 통해 세팅해주면 됨!
	public _09_Sawon(String sabun, String name, String deptName, int salary, int sudang) {
		super(sabun, name, deptName, salary);
		this.sudang = sudang;
	}
	
	
	// getter setter
	public int getSudang() {
		return sudang;
	}
	public void setSudang(int sudang) {
		this.sudang = sudang;
	}
	
	// 출력
	public void printInfo() {
		super.printInfo();
		System.out.println("-수당 :"+sudang+"만 원");
		System.out.println("");
	}
	

}
