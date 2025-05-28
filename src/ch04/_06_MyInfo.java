package ch04;

public class _06_MyInfo {

	// 멤버변수
	private String name;
	private int age;
	private String address;
	private String email;
	private String dream;

	// 디폴트 생성자
	public _06_MyInfo() {

	}

	// 매개변수 생성자
	public _06_MyInfo(String name, int age, String address, String email, String dream) {
		this.name = name;
		this.age = age;
		this.address = address;
		this.email = email;
		this.dream = dream;
	}

	// 멤버메서드(getter, setter)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;

	}

	public String getDream() {
		return dream;
	}

	public void setDream(String dream) {
		this.dream = dream;
	}

	// printInfo()
	public void printInfo() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("주소 : " + address);
		System.out.println("이메일 : " + email);
		System.out.println("꿈 : " + dream);
	}

}
