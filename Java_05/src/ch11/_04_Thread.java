package ch11;

// 2025.6.14	4교시

public class _04_Thread {
	
	public static void main(String[] args) {
		
		System.out.println("현재 사용되고 있는 스레드명 : " + Thread.currentThread().getName());	// main
		
		System.out.println("스레드의 최소 우선순위값 : "+Thread.MIN_PRIORITY);		// 1
		System.out.println("스레드의 최대 우선순위값 : "+Thread.MAX_PRIORITY);		// 10
		System.out.println("스레드의 중간 우선순위값 : "+Thread.MAX_PRIORITY);		// 5
		System.out.println("현재 수행되고 있는 스레드의 우선순윗값 : "+ Thread.currentThread().getPriority());		// 5
		
		
	}
}
