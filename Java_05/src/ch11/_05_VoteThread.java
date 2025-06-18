package ch11;

import java.util.Random;

// 2025.6.14	4교시


// 지역별 투표 현황 예제
public class _05_VoteThread implements Runnable {
	
	
	int sum = 0;						// 총 투표율
	int targetNum = 100;				// 개표율 100%
	Random random = new Random();		// 개표율 속도를 위한 랜덤함수
										// 난수발생 -> 개표율 속도
	
	@Override
	public void run() {
		StringBuffer sb = new StringBuffer();		// ▲ 모양의 그래프를 출력하기 위해 개표율을 ▲의 갯수로 출력 
		
		while (true) {		// 무한루프
			sum += random.nextInt(10);			// 총 개표율 : 10까지의 난수 발생(랜덤)
			sb.delete(0, sb.length());			// 그래프를 0으로 초기화, ▲의 길이만큼 
			
			if (sum > targetNum) {				// 투표율은 100을 넘을 수 없기 때문
				sum = 100;
				for(int i = 0; i < sum; i++) {
					sb.append("▲");
				}
				System.out.println(Thread.currentThread().getName()+"의 개표율 : "+ sum + "\t"+ sb);
				break;							// 무한루프 탈출
			} 
			else {
				for(int i = 0; i < sum; i++) {
					sb.append("▲");
				}
				System.out.println(Thread.currentThread().getName()+"의 개표율 : "+ sum + "\t" + sb);
				
				// 시간을 주면서 출력
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				finally {
					
				}
				
			}	// else

		}	// while
	}	// run()
}
