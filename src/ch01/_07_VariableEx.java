package ch01;

public class _07_VariableEx {
	public static void main(String[] args) {
		
		/*
		 * 연산
		 * 1. 사칙연산자
		 */
		System.out.println("=== 1. 사칙연산자 ===");
		// 3번 예제 참고
		
		/*
		 * 연산
		 * 2. 증감연산자 => 매우 중요
		 * 1) 전위연산자 => y = ++x;  => x값을 먼저 1증가시키고, 증가한 값을 y에 대입한다.
		 * 2) 후위연산자 => y = x++;  => x값을 먼저 y에 대입하고, x값을 1증가시킨다.
		 */
		System.out.println("=== 2. 증감연산자 ===");
		
		// 전위연산자
		int c = 5;
		int nextC = ++c;
		
		System.out.println("c : " + c);  // 6
		System.out.println("nextC : " + nextC);  // 6
		
		System.out.println("---------------");

		// 후위연산자
		int d = 5;
		System.out.println("d : " + d);   // 5
		int nextD = d++;
		System.out.println("nextD : " + nextD);  // 5
		System.out.println("d : " + d);  // 6
		
		System.out.println("---------------");
		
		// 단항연산자가 사칙연산보다 우선순위가 높다.
		// 동일한 변수에는 최종값이 대입된다.
		// 후위연산자는 한행에서 동일한 변수를 만나거나, 하위 문장에서 동일한 변수를 만날때 처리된다.
		
//		int e = 2, f = 3, result = 0;
//		System.out.println(e++ + --f * e--); // 2 + 2 * 3  = 8  
//		System.out.println("e : " + e); // 2  
//		System.out.println("f : " + f); // 2  
	
		int e = 2, f = 3, result = 0;
		System.out.println(e++ + --f * --e); // 2 + 2 * 2 = 6
		System.out.println(++e + --f * e--); // 3 + 1 * 3 = 6
		System.out.println(e++ + --f * e--); // 2 + 0 * 3 = 2
		System.out.println("e : " + e); //   2
		System.out.println("f : " + f); // 0
		
		result = ++e + --f * e--;
		System.out.println("result : " + result);  // 3 +  -1 * 3 = 0
		System.out.println("e : " + e); // 2
		System.out.println("f : " + f); // -1
		
		/*
		 * 연산
		 * 3. 관계연산자 => 매우 중요
		 * - > , <, >=, <=, 같다(==), 같지않다(!=)
		 * - 결과값은 boolean 타입 : 참(true), 거짓(false)
		 */
		
		System.out.println("=== 3. 관계연산자 ===");
		
		int c1 = 10;
		int c2 = 20;
		System.out.println("c1 == c2 : " + (c1 == c2));  // false 거짓
		System.out.println("c1 != c2 : " + (c1 != c2));  // true 참
		System.out.println("c1 > c2 : " + (c1 > c2));  // false 거짓
		System.out.println("c1 < c2 : " + (c1 < c2));  // true 참
		System.out.println("c1 >= c2 : " + (c1 >= c2));   // false 거짓
		System.out.println("c1 <= c2 : " + (c1 <= c2));  // true 참
		
		/*
		 * 연산
		 * 4. 논리연산자 => 매우 중요
		 * - 1 => 참(true) | 0 => 거짓(false)
		 * - &&(논리곱) : 두항이 모두 참인 경우 참
		 * - ||(논리합) : 두항중 하나의 항만 참이면 참
		 */
		
		System.out.println("=== 4. 논리연산자 ===");
		int z1 = 4, y1 = 5;
		System.out.println(z1 == 4 && y1 == 5);   // T && T = 1 * 1 = 1   true
		System.out.println(z1 == 4 && y1 == 10);  // false
		System.out.println(z1 == 4 || y1 == 7);   // true
		System.out.println(z1 == 7 || y1 == 7);   // false
		
		
		/*
		 * 연산
		 * 5. 복합대입연산자 => 매우 중요
		 */
		System.out.println("=== 5. 복합대입연산자 ===");
		
		int ii = 5;
		ii += 10;	// ii = ii + 10;
		System.out.println("ii : " + ii);   // ii : 15
		
		ii -= 10;	// ii = ii - 10;
		System.out.println("ii : " + ii);   // ii : 5
		
		ii *= 10;	// ii = ii * 10;
		System.out.println("ii : " + ii);   // ii : 50
		
		ii /= 10;	// ii = ii / 10;
		System.out.println("ii : " + ii);   // ii : 5
		
		ii %= 10;	// ii = ii % 10;
		System.out.println("ii : " + ii);    // ii : 5
	}
	
}
