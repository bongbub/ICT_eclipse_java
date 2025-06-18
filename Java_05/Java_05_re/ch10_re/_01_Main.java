package ch10_re;

// 2025.6.12	복습


// 싱글톤예제
public class _01_Main {
public static void main(String[] args) {
	
	_01_Company hong = _01_Company.getInstance();
	hong.gotoWork("홍길동");
	hong.work("홍길동");
	hong.eat("홍길동");
	hong.gotoHome("홍길동");
	
	_01_Company kim = _01_Company.getInstance();
	kim.gotoWork("김태희");
	kim.work("김태희");
	kim.eat("김태희");
	kim.gotoHome("김태희");
	
	System.out.println("--------------");
	System.out.println("hong == kim :"+(hong == kim));
	System.out.println("홍길동 :"+hong);
	System.out.println("김태희 :"+kim);
}
	
}
