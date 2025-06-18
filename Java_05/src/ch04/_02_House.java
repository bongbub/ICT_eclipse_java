package ch04;

public class _02_House {

	// _02_House 클래스를 호출하더라도
	// private 를 사용해서 변수를 생성하면
	// 변수 값에 직접 접근할 수 없음.
	// => 잘못된 값을 전달하는 것을 방지

	private String address; // 4. 멤버변수에 값이 전달됨.
	private int price;
	private String kind;
	private int size;
	private boolean window;  // 창문여부
	private int door;      //문 갯수
	
	
	
	// 돌려받는 get메서드
		public String getAddress() {
			return address;
		}
		// 멤버변수와 같은 변환타입 설정 -> String
		// 반환값 설정 -> address

	// 멤버메서드를 통해서 값을 전달하는 것이 효율적.
	// 멤버메서드
	// setter => set + 멤버변수(첫 글자 대문자)
	public void setAddress(String address) { // 2.매개변수로 값 전달됨
		// 멤버변수 = 매개변수;
		// HouseMain에 setAddress를 호출하며 전달한 매개변수
		// 강남구가 address로 들어오고,
		// this.address즉, 멤버변수로 대입됨(this는 멤버변수 구분할라공ㅋ)
		this.address = address; // 3. 매개변수 값이 멤버변수에 대입
	}
//	public void setAddress(String address) {
//	this.address = address;
//}

	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	

	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	public boolean getWindow() {
		return window;
	}
	
	public void setWindow(boolean window) {
		this.window = window;
	}

	
	public int getDoor() {
		return door;
	}
	public void setDoor(int door) {
		this.door = door;
	}
	
	
	public void setTestFuc(String address, int price, String kind, int size) {
		this.address = address;
		this.price = price;
		this.kind = kind;
		this.size = size;
	}

	

	// 출력
	public void printInfo() {
		System.out.println("주소 : " + address); // 5. 멤버변수 값 출력
		System.out.println("가격 : " + price);
		System.out.println("주거종류 : " + kind);
		System.out.println("평수 : " + size);
	}

}
