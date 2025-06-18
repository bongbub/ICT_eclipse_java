package ch10;

// 2025.6.12	4교시

public class _03_Human {

	int humanId;
	String humanName;
	
	// 매변생
	_03_Human(int humanId, String humanName){
		this.humanId = humanId;
		this.humanName = humanName;
	}
	
	// toString() 재정의
	@Override
	public String toString() {
		return ("주민번호 :"+humanId + " 이름 :"+ humanName);
	}
	
	// equals() 재정의
	@Override 
	public boolean equals(Object obj) {
		if(obj instanceof _03_Human) { // 1. 입력으로 들어온 obj가 _03_Human 타입인지 검사
			_03_Human human = (_03_Human)obj;	// 2. obj를 _03_Human 타입으로 형변환(다운캐스팅)
			
			if(this.humanId == human.humanId)	//3. 현재객체(this)와 비교대상 human의 객체 humanId와 같다면
				return true;					// 4. 같으면 true 리턴(두 객체는 동일한 것)
			
			else return false;					// 5. 다르면 false 리턴 (-> 다른개체)
		}
		return false;							// 6. obj가 _03_Human 타입이 아니면 false -> 비교대상 아님
	}
}
