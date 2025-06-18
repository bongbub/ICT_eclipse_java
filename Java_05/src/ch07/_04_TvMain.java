package ch07;

public class _04_TvMain {
	public static void main(String[] args) {

		// 다형성을 적용해서 인스턴스 생성
		_04_TV tv = new _04_SamsungTV();
		tv.turnOn();
		System.out.println("");
		tv.turnOff();

	}

}
