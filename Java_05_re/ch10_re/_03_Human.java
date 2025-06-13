package ch10_re;

//20250613 toString(), equals() 재정의

public class _03_Human {

	// 멤버변수
	int humanNo;
	String name;
	// 매개변수생성자
	public _03_Human(int humanNo, String name) {
		this.humanNo =humanNo;
		this.name = name;
	}
	// toString() 재정의
	public String toString() {
		return ("이름 : "+name + "- 번호 : "+humanNo);
	}
	
	// equals() 재정의
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof _03_Human) {		// 입력으로 들어온 오브제가 휴먼 타입인지 검사 
			_03_Human h = (_03_Human)obj;	// 오브제를 휴먼타입으로 다운캐스팅
			if(this.humanNo == h.humanNo) {	// 만약 현재객체와 h의 객체가 같다면
				return true;
			}
			else return false;				// 아니라면 false
		}
		return false;						// 오브제가 휴먼타입조차 아니라면 false
	}

}
