package ch04;

public class _09_PhoneStoreMain {

	// 2025.05.29
	public static void main(String[] args) {

		// 매개변수 생성자를 통한 값 전달
		System.out.println(" ==== 핸드폰 정보 ==== ");
		_09_Phone phone = new _09_Phone("아이폰", 1000);
		phone.printInfo();

		System.out.println(" ==== 구매고객 정보 ==== ");
		_09_Customer customer = new _09_Customer("김미미", 1000);
		customer.printInfo();

		System.out.println(" ~~~~ 결제요청 ~~~~ ");
		// 매개변수 생성자 호출할때 
		// _09_PhoneStore store == phone == "아이폰", 1000임
		// _09_PhoneStore store로 호출하면서 내부의 객체를 담아왔기때문
		_09_PhoneStore store = new _09_PhoneStore(phone);
		store.printInfo();
		
		
		// buyphone() 호출
		customer.buyPhone(store); // store == new_09_PhoneStore  
		

	}

}
