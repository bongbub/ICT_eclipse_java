package ch06;

	// 2025.5.30
	// 부모클래스
public class _01_Animal {
	private String kind;	// 종류
	private int legs;		// 4
	private int weight;		// 체중
	
	// 디폴트 생성자
	public _01_Animal() {
		System.out.println(" <<< _01_Animal생성자 >>>");
	}
	
	// getter setter
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getLegs() {
		return legs;
	}
	public void setLegs(int legs) {
		this.legs = legs;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	// 멤버변수 정보 출력
	public void printInfo() {
		System.out.println("종 :"+kind);
		System.out.println("무게 :"+weight);
		System.out.println("다리 :"+legs);
	}
	
	
}
