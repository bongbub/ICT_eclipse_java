package ch10_re;


// 2025.6.13	복습


// Enum예제 
enum Animal{CAT, DOG, TIGER}

public class _07_EnumEx {
	// 멤버변수
	private Animal kind; 		// Animal = 자료형 
	private String name;		// 이름
	
	
	// 디폴트생성자
	public _07_EnumEx() {}
	
	// 매개변수 생성자
	public _07_EnumEx(Animal kind, String name) {
		this.kind = kind;
		this.name = name;
	}
	
	
	// 멤버메서드
	public Animal getKind() {
		return kind;
	}
	public void setKind(Animal kind) {
		this.kind = kind;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// toString()
	public String toString() {
		return String.format("종류 :  %-5s | 이름 : %s", kind, name);
	}
	
}
