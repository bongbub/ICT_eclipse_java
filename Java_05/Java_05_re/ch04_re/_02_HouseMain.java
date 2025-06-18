package ch04_re;

public class _02_HouseMain {
	
	public static void main(String[] args) {
		
//		// 생성자 추가
//		_02_House house = new _02_House();
//		
//		house.setAddress("서울시 강남구 역삼동");
//		house.setPrice(5000);
//		house.setKind("아파트");
//		house.setSize(85);
//		house.setLocation("역삼동");
//		house.setNumOfRooms(3);
//		house.setHasGarage(true);
//		
//		

		
		
		// _02_House에서 생성한 생성자로 
		
		_02_House house = new _02_House("서울시 강남남구 역삼삼동", 9000, "아팟뜨", 66, "역삼삼동동", 4, false);
		
		house.printInfo();		
	
		
	}

}
