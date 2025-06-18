package ch11;

// 2025.6.14	5교시

// 1) Thread 클래스를 상속하기 - run() 메서드를 override
public class _06_JoinThread extends Thread{
	
	int start;
	int end;
	int sum=0;
	
	// 디폴트생성자
	public _06_JoinThread () {}
	// 매개변수생성자
	public _06_JoinThread (int start, int end) {
		this.end = end;
		this.start = start;
	}
	
	

	@Override
	public void run() {
		for(int i=start; i<=end; i++) {
			sum += i;
		}
		// System.out.println("sum : "+ sum);
	}
}
