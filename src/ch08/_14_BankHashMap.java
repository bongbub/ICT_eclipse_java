package ch08;

// 2025.6.11 아침 테스트

import java.util.HashMap;
import java.util.Iterator;

public class _14_BankHashMap {
	// 디폴트 생성자를 통해 BankHashMap 생성
		HashMap<Integer, _14_Bank> hashMap;
		public _14_BankHashMap(){
			hashMap = new HashMap<Integer, _14_Bank>();
		}

		// HashMap에 Bank 추가
		public void insertBank(_14_Bank bank){
			hashMap.put(bank.getAcc(), bank);
		}	

		// book 삭제
		public boolean deleteBank(int accountNo){
			if(hashMap.containsKey(accountNo)){
				hashMap.remove(accountNo);
				return true;
			}
			else {
				System.out.println(" 존재하지 않는 계좌번호 입니다. ");
				return false;
			}
		}

		// book 출력
		public void queryBank(){	
			// 1. 향상된 for문으로 출력
			System.out.println(" ~~ 향상된 for문 ~~~");
			for (int key : hashMap.keySet()){
				_14_Bank bank = hashMap.get(key);
				System.out.println(bank);
			}
			// 2. 반복자로 출력
			System.out.println(" ~~ 반복자 출력 ~~~");
			Iterator<Integer> iterator = hashMap.keySet().iterator();
			while(iterator.hasNext()){
				int key = iterator.next();
				_14_Bank bank = hashMap.get(key);
				System.out.println(bank);
			}
			System.out.println("");
		}



}
