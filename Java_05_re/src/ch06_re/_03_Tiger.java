package src.ch06_re;


// 자식클래스
public class _03_Tiger extends _03_Animal{
	@Override // (생략가능)
	public void move() {
		System.out.println("호랑이가 네발로 달려옵니다");
	}
	 
	// 부모클엔 없고 Tiger만 갖고 있는 메서드
	public void nyam() {
		System.out.println("호랑이가 사냥합니당 어흥");
	}

}
