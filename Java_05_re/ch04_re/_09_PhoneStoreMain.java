package ch04_re;

public class _09_PhoneStoreMain {
	public static void main(String[] args) {
		
		
		_09_Phone phone = new _09_Phone("아이폰", 1000);

		_09_Customer cus = new _09_Customer("김민지", 1000);
		
		
		
		_09_PhoneStore store = new _09_PhoneStore(phone);
		
		System.out.println("결제요청");
		cus.buyPhone(store);
		
		
	}

}
