package ch04;

public class _08_StaticEx {
	public static void main(String[] args) {
		
		_08_Person person = new _08_Person("사람");

//		_08_StaticEx ex = new _08_StaticEx();
//		
//		ex.personMove(person);
		personMove(person);						// 방법1
		personMove(new _08_Person("사람"));		// 방법2
	}
	
//	public void personMove(_08_Person person) {
//		person.readBook();
//		person.move();
//		person.sleep();

	public static void personMove(_08_Person person) {
		person.readBook();
		person.move();
		person.sleep();

	}

}
