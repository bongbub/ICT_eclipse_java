package ch05;

public class _03_ArrayEx {

	public static void main(String[] args) {
		// 2025.5.30
		
		
		// 2차원 배열
		// 자료형 배열명 = new 자료형[형개수][열개수];
		int[][] arr2 = new int[2][3]; 
		
		int[][] arr3 = {{1,2,3},{4,5,6}};  // 2행 3열
		
		
		// 배열 출력
		for(int i=0; i<arr2.length; i++) {	// 행 - 배열.lenght -> 2회 반복
			for(int j=0; j < arr2[i].length; j++) {
				System.out.printf("%d행 %d열일 때 값은 %d입니다.",i, j, arr2[i][j]);
				System.out.println("");
			}
		}
		System.out.println("--------------------------");
		
		for(int i=0; i<arr3.length; i++) {
			for(int j=0; j<arr3[i].length; j++) {
				System.out.printf("%d행 %d열의 값은 %d입니다.", i,j,arr3[i][j]);
				System.out.println("");
			}
		}
		
		
		// 예제   ABCD  EFGH   IJKL 출력하기
		
		String[][] str = {{"A","B","C","D"},{"E","F","G","H"},{"I","J","K","L"}};
		for(int i=0; i<str.length; i++) {
			for(int j=0; j<str[i].length; j++) {
				System.out.printf("%s  ",str[i][j]);
			}
			System.out.println("");
		}
		
	}
}
