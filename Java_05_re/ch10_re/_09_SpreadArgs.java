package ch10_re;

// 2025.6.13	복습

public class _09_SpreadArgs {

	// 디폴트생성자
	public _09_SpreadArgs() {
	}

	public void callA(String a1, String a2) {
		System.out.println(a1 + "," + a2);
	}


	public void callB(String... a) {
		// for문 출력
		for (int i = 0; i < a.length; i++) {
			System.out.print(a[i] + " ");
		}
		System.out.println();

		// 향상된 for문
		for (String b : a) {
			System.out.print(b+" ");
		}
	System.out.println();
	}
	

	public void callC(String name, int... num) {
		// for
		for (int i = 0; i < num.length; i++) {
			System.out.print(num[i] + " ");
		}
		System.out.println();

		// 향상된for
		for (int val : num) {
			System.out.print(val);
		}
		System.out.println();
	}

}
