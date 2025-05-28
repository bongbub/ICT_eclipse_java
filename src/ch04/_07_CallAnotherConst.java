package ch04;
	
	//178
	
	// this로 다른 생성자 호출하기
	
class Person{
	
	String name;
	int age;
	
	
	Person(){
		this("이름없음", 29);
	}
	
	Person(String name, int age){
		this.name = name;
		this.age = age;
		
	}
}



// 한 파일에 여러 클래스 사용
// 메인(main)클래스에 public 붙여주기
public class _07_CallAnotherConst {
	public static void main(String[] args) {
		Person noName = new Person();
		System.out.println(noName.name);
		System.out.println(noName.age);
	}
}
