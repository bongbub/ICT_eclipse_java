package ch11;


// 2025.6.14	3교시


	// 1) Thread 클래스 상속하기 - run() 메서드를 override
public class _01_MyThread extends Thread{
	
	@Override
	public void run() {
		// 1부터 10까지 출력 예제
		for(int i = 1; i<=10; i++) {
			try {
				
				// Interrupt() 메서드 :
				//		sleep(), wait(), join() -> 스레드의 작업을 중지(Not Runnable)할 때 호출  
				Thread.sleep(2000);		// 2초 간격 -> 2초동안 Not Runnable 유도
			} catch (InterruptedException e) {	// InterruptedException -> Not Runnable 상태에서 깨워준다
				e.printStackTrace();
			}
			finally {
				
			}
			System.out.println(i+ " ");
		}
	}

	/* 프로세스 : 프로그램이 메모리에 할당된 상태 .. 작업관리자(프로그램, 메모리)
	 * 멀티태스킹 : 여러개의 어플리케이션을 동시에 실행해서 컴퓨터 시스템의 성능을 높이기 위한 기법이다.
	 *           태스크 : 하나의 업무 처리 단위
	 *          예)음악들으면서 동시에 운동
	 *             문서 편집하면서 인터넷에서 파일 다운로드
	 *  멀티스레딩 : 병렬작업을 하나의 어플리케이션 안에서 동시에 하는 것을 말한다.
	 *         스래드 : 각각의 작업.. 실, 실행흐름     
	 *               CPU(중앙처리장치)를 점유해 일련의 명령어들이 실행되는 단위를 스레드라 한다.      
	 *         
	 *  멀티스레딩의 장점
	 *  - CPU의 사용률을 향상시킨다.
	 *  - 자원을 보다 효율적으로 사용할 수 있다.
	 *  - 사용자에 대한 응답성이 향상된다.
	 *  - 작업이 분리되어 코드가 간결해진다.
	 *  
	 * Thread 문법
	 * 1) Thread 클래스를 상속하기 - run() 메서드를 override
	 * 2) Runnable 인터페이스를 구현하는 방법 - run() 메서드를 override
	 */
	
	
}
