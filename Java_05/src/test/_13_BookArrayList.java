package test;

import java.util.ArrayList;
import java.util.Iterator;

public class _13_BookArrayList {

	// ArrayList<_13_Book> list = new ArrayList<_13_Book>();
	
	// 디폴트 생성자를 통해 ArrayList생성
	private ArrayList<_13_Book> list;
	public _13_BookArrayList(){
		list = new ArrayList<_13_Book>();
	}

	// ArrayList에 book 추가
	public void insertBook(_13_Book book){
		list.add(book);
	}

	// book 삭제
	public boolean removeBook(int bookNo) {
		for(int i=0; i<list.size(); i++){
			_13_Book b = list.get(i);
			int temp = b.getBookNo();
			if(temp == bookNo){
				list.remove(i);
				return true;
			}
		}
		System.out.println("해당하는 도서가 없습니다.");
		return false;
	}

	// book 출력
	public void showAllBook(){

	// 1. 향상된 for문
	System.out.println(" == 향상된 for문 출력 ==");
	for(_13_Book b : list){
		System.out.println(b.toString());
	}

	// 2. 반복자
	System.out.println(" == 반복자 출력 ==");
	Iterator<_13_Book> iterator = list.iterator();

	while(iterator.hasNext()){
		System.out.println(iterator.next());
	}

	}

}
