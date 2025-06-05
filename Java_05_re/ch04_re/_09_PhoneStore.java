package ch04_re;

public class _09_PhoneStore {
	
	// 멤버변수로 클래스를 참조
	private _09_Phone phone;
	// _09_Phone에 있는 객체 정보를 가져옴
	
	// 디폴생
	public _09_PhoneStore(){
		
	}
	
	// 매개생
	public _09_PhoneStore(_09_Phone phone) {
		this.phone = phone;
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
	
	// 휴대폰 판매
	public _09_Phone sellPhone(String model, double budget) {
		
		String phoneModel = phone.getModel();
		// phoneModel에 phone.getModel()에서 가져온 값을 줌
		// "아이폰", 1000
		
		// 원하는 모델이 매장 보유 모델과 같고, 핸폰 가격이 예산보다 작거나 같으면
		if(model.equals(phoneModel) && budget >= phone.getPrice()) {
			// 구매완료 및 요금제등록, 프로모션 할인, 데이터 저장함수 출력
			registerPayment();
			discountPromotion();
			savaData();
			return phone;
		}
		else {
			return null;
		}
	}
	
	public void printInfo() {
		System.out.println("");
		System.out.println("phone :"+phone);
	}
	
	
	
	
}
