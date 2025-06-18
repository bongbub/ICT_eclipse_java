package ch11;

// 2025.6.14	5교시

public class _06_JoinThreadMain {
	public static void main(String[] args) throws InterruptedException {
		
		// 매개변수 생성자호출
		_06_JoinThread jt = new _06_JoinThread(1,50);
		_06_JoinThread jt2 = new _06_JoinThread(51,100);
		
		
		jt.start();
		jt2.start();

		
		// join() 메서드는 스레드 간의 순차작업에 활용할 수 있다
		// -> 즉, main() 함수의 결과가 바로 출력되지 않고,
		// 두 스레드의 수행이 끝난 후에 합산한 결과가 출력된다.
		jt.join();	// 예외처리 : throws 선택 -> InterruptedException
		jt2.join();
		
		
		int total = jt.sum + jt2.sum;
		System.out.println(jt.sum +" + "+ jt2.sum);
		
		
		
	}
}
