package ch04_re;

public class _09_Customer {
	
	// 멤변
	private String name;
	private double budget;
	
	// 디생
	public _09_Customer() {
		
	}
	
	// 매생
	public _09_Customer(String name, double budget) {
		this.name = name;
		this.budget = budget;
	}

	// get~set~
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	
	// 구입완료메서드
	
	// sellPhone의 매개변수로 아이폰과 1000타를 전달 - 돌려받는 return phone
	public void buyPhone(_09_PhoneStore store) {
		_09_Phone phone = store.sellPhone("아이폰", budget);
		if(phone != null) {
			System.out.println("구매성공");
		}
		else {
			System.out.println("구매실패");
		}
	}
}
