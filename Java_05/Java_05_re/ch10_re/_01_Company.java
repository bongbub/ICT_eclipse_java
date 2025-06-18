package ch10_re;

//2025.6.12	 복습

public class _01_Company {
	
	// 멤버변수 worker
	public String worker;
	
	// 1. 디폴트 생성자를 private로 생성
	private _01_Company(){
		System.out.println(" Company 디폴트 생성자임");
	}
	
	
	// 2. 클래스 내부에 static으로 유일한 인스턴스 생성
	static _01_Company instance = new _01_Company();
	
	
	
	// 3. 외부에서 참조할 수 있는 public 메서드 생성
	public static _01_Company getInstance() {
		// 만약 instance 값이 null 이면 새로 만들어
		if(instance == null) {
			instance = new _01_Company();
		}
		return instance;
	}
	
	
	
	// 멤버메서드
	
	// 출근하다 gotoWork()
	public void gotoWork(String worker) {
		System.out.println(worker + "이 출근~");
	}
	
	// 일하다 work()
	public void work(String worker) {
		System.out.println(worker + "이 일해용~");
	}
	// 점심먹다 eat()
	public void eat(String worker) {
		System.out.println(worker + "이 냠냠해용~");
	}
	// 퇴근하다 gotoHome()
	public void gotoHome(String worker) {
		System.out.println(worker + "이 집가요 ~~~~~~~~~~~");
	}
}
