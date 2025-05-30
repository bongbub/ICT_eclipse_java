package ch04;

public class _08_Person {

	private String kind;

	public _08_Person(String kind) {
		this.kind = kind;
	}

	public void move() {

		System.out.printf("%s이 움직입니다.", kind);
		System.out.println("");

	}

	public void readBook() {
		System.out.printf("%s이 독서를 합니다", kind);
		System.out.println("");
	}

	public void sleep() {
		System.out.printf("%s이 잠을 잡니다", kind);
	}

}
