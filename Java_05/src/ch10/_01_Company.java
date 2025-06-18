package ch10;

// 2025.6.12	7교시

// 싱글톤예제
public class _01_Company {

	
	// 멤버변수
	public String worker;
	
	// - 1단계. 디폴트생성자를 private으로 만들기
	 private _01_Company() {
		System.out.println("<<< 디폴트생성자 >>>");
	}	// 다른 곳에서 new로 생성자에 접근하지 못하도록 private로 선언

	// - 2단계. 클래스 내부에 static으로 유일한 인스턴스 생성하기
	 static _01_Company instance = new _01_Company();
	 
	 //  3단계. 외부에서 참조할 수 있는 public 메서드 만들기
	 public static _01_Company getInstance() {
		 
		 // 만약 instance 값이 null일떄 새로 만들기
		 if(instance ==null) {
			 instance = new _01_Company();
		 }
		 return instance;	// 인스턴스의 자료형(=_01_Company)
	 }
	 
	 
	// 멤버메서드
	 // 출근하다
	public void gotoWork(String worker) {
		System.out.println(worker + "이 출근하다");
	}
	// 일하다
	public void work(String worker) {
		System.out.println(worker+"이 일하다");
		
	}
	// 점심먹다
	public void gotoCafeteria(String worker) {
		System.out.println( worker +"랑 카페간당");
	}
	
	// 퇴근하다
	public void gotoHome(String worker) {
		System.out.println(worker+"(이)는 집에 가용");
	}
	
	
	 /* p204  
	    * [면접] 싱글톤패턴
	    * - 인스턴스를 단 하나만 생성하는 디자인 패턴
	    * - static을 응용하여 프로그램 전반에서 사용하는 동일한 인스턴스를 하나만 생성하는 방식
	    * - 접근할 클래스에 여러 메서드가 있을 때, 외부 클래스가 해당 메서드에 접근할 때마다 
	    *   객체를 생성할 필요없이 getInstance()를 통해 참조변수만 리턴받아 접근한다.
	    *   열번, 백번을 호출해도 항상 같은 주소의 인스턴스가 반횐된다.
	    *  
	    * 싱글톤패턴 생성
	    * - 1단계. 디폴트생성자를 private으로 만들기
	    * - 2단계. 클래스 내부에 static으로 유일한 인스턴스 생성하기
	    * - 3단계. 외부에서 참조할 수 있는 public 메서드 만들기
	    * 
	    * 호출
	    * - 접근클래스명 참조변수 = 접근클래스명.getInstance();
	    * 예) _01_Company com1 = _01_Company.getInstance();  // 클래스명.메서드명
	    */
	
	
	
}
