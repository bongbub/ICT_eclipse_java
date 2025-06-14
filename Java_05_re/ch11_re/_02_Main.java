package ch11_re;
import ch11._02_MyThread;

public class _02_Main {
	public static void main(String[] args) {
		// Runnable로 접근했으니 Thread 생성
		
		Thread th = new Thread(new _02_MyThread());
	
	}
}
