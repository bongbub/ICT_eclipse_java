package ch10;


// 2025.6.13	7교시

public class _09_Main {

	public static void main(String[] args) {
		
		_09_SpreadArgs spread = new _09_SpreadArgs();
		
		spread.callArgs("취킨", "바나나");
		spread.callArgs2("취킨", "바나나","연어스테이크","파스타");
		spread.callArgs3("김태희 ", 10, 20,30,40,50,60);
		
	}
}
