package ch10_re;

// 2025.6.13	복습

public class _05_StringTest1 {

	public static void main(String[] args) {

		String str = "Happy Happy Dog wowowow ~~";
		String s1, s2, s3, s4, s5;

		// 문자열길이 length()
		System.out.println("문자열길이" + str.length());

		// 문자열결합 : concat("연결할문자")
		s1 = str.concat("하이요 ㅋ");
		System.out.println("concat:" + s1);

		// 문자열교환 : replace(oldChar, newChar)
		s2 = s1.replace("wow", "쿠쿠쿠");

		// 부분문자열 : substring(beginIndex, endIndex)
		// beginIndex 부터 endIndex 전까지
		s3 = s2.substring(3, 9);
		System.out.println("s3 : " + s3);

		// 대문자변환 toUpperCase()
		s4 = s2.toUpperCase();
		System.out.println("s4 :" + s4);

		// 소문자 변환 toLowerCase()
		s5 = s2.toLowerCase();
		System.out.println("s5 :" + s5);

		// split("쪼갤문자") 쪼갤문자 기준으로 쪼개짐
		String hp = "010-3932-49491";
		String[] arr = hp.split("-");
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);

		// 이용해서 반복문으로 출력
		String day = "월요일, 화요일, 수요일, 목요일, 금요일, 토요일, 일요일";
		String[] d = day.split(", ");
		for (int i = 0; i < day.length(); i++) {
			System.out.println(arr[i]);
		}
		System.out.println();

		// trim() 공백제거
		String t = "       안녕 ㅋ 내부공백은 제거안됨   ";
		System.out.println("원본 : " + t);
		System.out.println("공백제거 :" + t.trim());

	}
}
