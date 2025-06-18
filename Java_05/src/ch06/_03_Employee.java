package ch06;

public class _03_Employee {
	
	// 2025.6.2 (1교시 시험)
	// 상속 예제
	
	
	// 멤버변수
	private String sabun;		// 사번    S001 		S002
	private String name;		// 이름    김태희 		박나래
	private String deptName;	// 부서명  전산실 		전산
	private int salary;			// 급여   100000 	 	8000
	private String tel;			// 연락처 02-123-4567 02-222-4444
	private String address; 		// 주소  서울시 강남구  	서울시 마포구
	
	// 디폴트 생성자
	public _03_Employee() {
		//System.out.println(" --  Employee --");
		//System.out.println("");
		
	}
	
	// 매개변수 생성자
	public _03_Employee(String sabun, String name, 
			String deptName, int salary,
			String tel, String address) {
		this.sabun = sabun;
		this.name = name;
		this.deptName = deptName;
		this.salary = salary;
		this.tel = tel;
		this.address = address;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	// 출력
	public void printInfo() {
		System.out.println("-사번 :" +sabun);
		System.out.println("-이름 :" +name);
		System.out.println("-부서명 :" +deptName);
		System.out.println("-연봉 :" +salary+"만 원");
		System.out.println("-연락처 :" +tel);
		System.out.println("-주소 :" +address);
		
	}
}
