package ch04;

public class _09_Customer {
	
	// 2025.5.29
	// 핸드폰 구매 고객 클래스
	
	private String name;    // 고객명 : 김미미
	private double budget;  // 예산 : 1000000
	
	
	// 디폴트 생성자
	public _09_Customer() {}
	
	// 매개변수 생성자
	public _09_Customer(String cname, double cbudget) {
		name = cname;
		budget = cbudget;
	}
	
	
	// 멤버메소드 getter setter
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
	
	
	// 구입완료 출력
	// _09_PhoneStore의 sellPhone()을 접근하고 싶음.
	// 1. new 생성자로 들어가거나, (비효율)
	// 2. '클래스타입'의 '참조변수'를 통해 접근할 수 있음
	public void buyPhone(_09_PhoneStore store) {
		// sellPhone의 매개변수로 아이폰과 1000을 전달
		// 돌려받는 return 'phone'
		_09_Phone phone = store.sellPhone("아이폰", budget); // return 받는 값의 타입 -> _09_Phone클래스
		
		if(phone != null) {
			System.out.println("구입 완료");
		}
		else {
			System.out.println("구입 실패");
		}
	}
	
	
	// 출력용 멤버메서드 printInfo()
	public void printInfo() {
		System.out.println("고객명 : "+name);
		System.out.println("예산 : " + budget);
		System.out.println("");
	}

	
	
	
	
	
}
