package ch06;

public class _04_BankMain {
	public static void main(String[] args) {

		System.out.println(" <<_04_ShinhanBank 정보 >>");
		System.out.println(" -- 방법1) 디폴트생성자 + setter로 값 전달");

		_04_ShinhanBank shin = new _04_ShinhanBank();
		shin.setBankname("신한은행");
		shin.setAccountNumber("01010230415523");
		shin.setRate(1.4);
		shin.setEvent("금리인하");
		shin.executeLoan();
		shin.printInfo();

		System.out.println("");
		System.out.println(" ~~~~~~~~~ ");
		System.out.println("");

		System.out.println(" <<_04_WooriBank 정보 >>");
		System.out.println(" -- 방법2) 자식매개변수 생성자로 값 전달");

		_04_WooriBank woo = new _04_WooriBank("우리은행", "0300149158158", 2.3, "vip");
		woo.printInfo();

	}

}
