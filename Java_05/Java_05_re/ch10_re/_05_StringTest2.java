package ch10_re;

//2025.6.13	복습


// p378 주소값비교예제
public class _05_StringTest2 {
	public static void main(String[] args) {
		
		String str = new String("abc");			
		String str2 = new String("abc");			
		
		System.out.println(str == str2);		// false
		System.out.println(str.equals(str2));	// true
		
		String str3 = "abc";
		String str4 = "abc";
		
		System.out.println(str3 == str4);		// true
		System.out.println(str3.equals(str4));	// true
	}
}
