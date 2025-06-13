package ch10;

import java.util.ArrayList;
import java.util.List;

// 2025.6.13	5교시

public class _07_Main {
	public static void main(String[] args) {
		
		
		// 매개변수 생성자를 통해 값 전달
		_07_EnumEx cat = new _07_EnumEx (Animal.CAT, "춘봉이");
		_07_EnumEx dog = new _07_EnumEx (Animal.DOG, "밤비");
		_07_EnumEx fish = new _07_EnumEx (Animal.FISH, "hahaha");
		_07_EnumEx tig = new _07_EnumEx (Animal.TIGER, "호랑나비");
		_07_EnumEx bird = new _07_EnumEx (Animal.BIRD, "새덕후");
		_07_EnumEx bear = new _07_EnumEx (Animal.BEAR, "곰을거꾸로하면문");
		

		// 리스트 생성
		List<_07_EnumEx> list = new ArrayList<_07_EnumEx>();
		// 리스트 담기
		list.add(cat);
		list.add(dog);
		list.add(fish);
		list.add(tig);
		list.add(bird);
		list.add(bear);
	
		// 향상된 for문(for-each)로 출력
		for(_07_EnumEx en : list) {
			System.out.println(en);
		}
		
	
	}
}
