package ch10_re;

//2025.6.13	복습

// 두 문자열 연결예제
public class _05_StringTest3 {
	
	public static void main(String[] args) {
		
		String str = new String("java");
		String str2 = new String("android");
		
		System.out.println(str);
		System.out.println("처음 문자열 주소값 :"+System.identityHashCode(str2));
		
		str = str.concat(str2);
		
		System.out.println(str);
		System.out.println("연결된 문자열 주소값"+System.identityHashCode(str2));
	}
}
