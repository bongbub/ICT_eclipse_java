package ch04;

public class _02_HouseMain {
	public static void main(String[] args) {

		_02_House house = new _02_House();

//		house.address = "강남구";
//		house.price = 200000;
//		house.kind = "아파트";
//		house.size = 34;

		// 1. setter를 통해 매개변수로 넣어준 값이 _02_House의 (2.매개변수)로 간다
		house.setAddress("서대문구");

		house.setPrice(-10);
		house.setKind("한옥");
		house.setSize(20);
		house.setWindow(true);
		house.setDoor(2);

		// 한 번에도 되는지 테스틍 ㅋ
		// 걍 매개 변수 값만 개수, 타입 맞춰서 잘 넣어주면 댐
//		house.setTestFuc("해보장", 939, "야호", 194);

//		System.out.println("==== house 출력문 ====");
//		house.printInfo();

		System.out.println("==== Main 에서 출력 ====");
		System.out.println("위치 : " + house.getAddress());
		
		if(house.getPrice()<=0) {
			System.out.println("가격은 0원 이상입니다.");
		}else {
			System.out.println("가격 : " + house.getPrice());
		}
		
		System.out.println("종류 : " + house.getKind());
		if(house.getSize()<=0) {
			System.out.println("평수는 0평 이상입니다.");
		}else {
			System.out.println("평수 : " + house.getSize());
		}
		if (house.getWindow()==true) {
			System.out.println("창문 O");
		}else {
			System.out.println("창문 X");
		}
		
		if(house.getDoor()<=1) {
			System.out.println("문은 1개");
		}else {
			System.out.println("문은 2개 이상");
		}
		
	}
}
