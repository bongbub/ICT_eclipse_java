package ch10;

// 2025.6.12	7교시

public class _01_Main {

	public static void main(String[] args) {
		
		// 01_Company = hong _01_Company();
		// 01_Company = kim _01_Company();
		
		
		
		_01_Company hong = _01_Company.getInstance();
		hong.gotoWork("홍길동");
		hong.work("홍길동");
		hong.gotoCafeteria("홍길동");
		hong.gotoHome("홍길동");

		System.out.println("--------------");
		_01_Company kim = _01_Company.getInstance();
		
		kim.gotoWork("김태희");
		kim.work("김태희");
		kim.gotoCafeteria("김태희");
		kim.gotoHome("김태희");
		System.out.println("--------------");
		System.out.println("hong == kim :"+(hong == kim));
		System.out.println("홍길동 :"+hong);
		System.out.println("김태희 :"+kim);
		
	}
}
