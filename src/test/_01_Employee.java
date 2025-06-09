package test;

public class _01_Employee {
	
	// 2025.6.2 (1교시 시험)
	// 상속 예제
	
	
	// 멤버변수
	private String sabun;
	private String name;
	private String deptName;
	private int salary;

	// 디폴트 생성자
	public _01_Employee() {
		//System.out.println(" --  Employee --");
		//System.out.println("");
		
	}
	
	// 매개변수 생성자
	public _01_Employee(String sabun, String name, String deptName, int salary) {
		this.sabun = sabun;
		this.name = name;
		this.deptName = deptName;
		this.salary = salary;
	}
	
	// getter setter
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	// 출력
	public void printInfo() {
		System.out.println("-사번 :" +sabun);
		System.out.println("-이름 :" +name);
		System.out.println("-부서명 :" +deptName);
		System.out.println("-연봉 :" +salary+"만 원");
		
	}
}
