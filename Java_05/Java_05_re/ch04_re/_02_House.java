package ch04_re;

public class _02_House {
	
	private String address;      // 주소
	private int price;           // 가격
	private String kind;         // 주거종류
	private int size;            // 평수
	private String location;     // 세부 주소
	private int numOfRooms;      // 방 갯수
	private boolean hasGarage;   // 차고 여부


	
	// 1. 생성자를 통해 한 번에 초기화
	public _02_House(String address, int price, String kind, int size, String location, int numOfRooms, boolean hasGarage) {
		this.address = address;
		this.price = price;
		this.kind = kind;
		this.size = size;
		this.location = location;
		this.numOfRooms = numOfRooms;
		this.hasGarage = hasGarage;
		
	}
	
	
	// address
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	// price
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	// kind
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	//size
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	// location
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	// numOfRooms
	public int getNumOfRooms() {
		return numOfRooms;
	}
	public void setNumOfRooms(int numOfRooms) {
		this.numOfRooms = numOfRooms;
	}
	
	// hasGarage
	public boolean getHasGarage() {
		return hasGarage;
	}
	public void setHasGarage(boolean hasGarage) {
		this.hasGarage = hasGarage;
	}
	
	
	// 정보 출력 메서드
	public void printInfo() {
		System.out.println("주소 : "+ address);
		System.out.println("가격 : " + (price <=0 ? "가격은 0원 이상이어야 합니다." : price + "원"));
		System.out.println("종류 : "+kind);
		System.out.println("평수 : " + (size <= 0 ? "평수는 0평 이상이어야 합니다." : size + "평"));
		System.out.println("주소 : " + location);
		System.out.println("방 : "+ numOfRooms + "개");
		System.out.println("차고 유무 : "+ (hasGarage ? "있음" : "없음") );
	}
}
