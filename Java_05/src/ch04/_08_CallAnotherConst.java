package ch04;

class Person2{
	String name;
	int age;
	
	Person2(){
		this("이름없음", 1);
	}
	
	Person2(String name, int age){
		this.name = name;
		this.age = age;
	}
	
	
	// 반환형은 클래스형
	Person2 returnInself() {
		return this;
	}
}


public class _08_CallAnotherConst {
	public static void main(String[] args) {
		Person2 no = new Person2();
		System.out.println(no.name);
		System.out.println(no.age);
		
		
		Person2 p = no.returnInself();
		System.out.println(p);
		System.out.println(no);
	}

}
