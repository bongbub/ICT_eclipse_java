package ch10_re;

// 2025.6.13	복습

public class _06_StringBuffer {

	public static void main(String[] args) {
		
		// 추가 : append()
		StringBuffer sb = new StringBuffer();
		
		sb.append("곰세마리가");
		sb.append("한 집에 있어");
		sb.append("아빠곰 엄마곰 애기곰");
		System.out.println("sb :"+sb);
		System.out.println("sb.toString() :"+sb.toString());
		
		
		// 삽입 : insert(시작위치, 문자열)
		sb.insert(6, "웅앙");
		System.out.println(sb);
		
		// subString(시작위치, 끝위치)
		System.out.println(sb.substring(4,16));
		System.out.println(sb.substring(6));
		
	}
}
