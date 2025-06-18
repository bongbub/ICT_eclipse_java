package ch04;

// 2025.5.29
// 대리점 클래스

public class _09_PhoneStore {

	// 멤버변수
	private _09_Phone phone; // _09_Phone클래스를 가져옴(_09_Phone의 정보를 다 가져옴)
	// 휴대폰 객체정보 -> "아이폰", 1000

	// 디폴트 생성자
	public _09_PhoneStore() {
	}

	// 매개변수 생성자
	public _09_PhoneStore(_09_Phone phone) {
		this.phone = phone;
	}

	// 휴대폰 판매
	// 구입하려는 모델
	public _09_Phone sellPhone(String model, double budget) {

		String phoneModel = phone.getModel(); // phoneModel 은 getModel에서 가져온 "아이폰"이됨 -> 구입할 모델

		// 원하는 모델이 대리점에 있으면서 핸드폰 가격이 예산보다 작거나 같으면
		// 원하는 모델 == 매장보유 모델 && 예산 >= 핸드폰 가격
		// String 은 ==안쓰고 .equals() 사용
		if (model.equals(phoneModel) && budget >= phone.getPrice()) {

			// 요금제 등록함수 호출
			registerPayment();

			// 프로모션 할인함수 호출
			discountPromotion();

			// 데이터 저장함수 호출
			savaData();

			return phone;
			
		} 
		else {
			return null;
		}
	}

	// 요금제 등록
	private void registerPayment() {
		System.out.println("대리점 : 요금제를 등록합니다. 약정을 등록합니다.");
	}

	// 프로모션 할인
	private void discountPromotion() {
		System.out.println("대리점 : 프로모션으로 할인합니다.");
	}

	// 데이터 저장
	private void savaData() {
		System.out.println("대리점 : 데이터를 저장하고 새로운 폰으로 이동합니다.");
	}

	
	// 출력
	public void printInfo() {
		System.out.println("");
		System.out.println("phone :" + phone);
	}

}
