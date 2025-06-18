package ch10_re;

import java.util.ArrayList;
import java.util.List;

// 2025.6.13	복습

public class _07_Main {
	public static void main(String[] args) {
		
		
		// 매변생을 통해 값 전달
		_07_EnumEx cat = new _07_EnumEx(Animal.CAT, "곡앵잉");
		_07_EnumEx dog = new _07_EnumEx(Animal.DOG, "강알직");
		_07_EnumEx tiger = new _07_EnumEx(Animal.TIGER, "홀앵익");
		
		
		// 리스트 생성
		List<_07_EnumEx> list = new ArrayList<_07_EnumEx>();
		
		
		// 리스트에담기
		list.add(cat);
		list.add(dog);
		list.add(tiger);
		
		// 향상for문으로 출력
		for(_07_EnumEx ex : list) {
			System.out.println(ex);
		}
	}
}
