package ch03;

public class TestStar {
	
	
	public static void main(String[] args) {

		
		System.out.println("왼쪽찍기");
		for (int i=1; i<=6; i++) {
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}
			System.out.println("\n");
		}
		
		
		System.out.println("왼쪽아래로");
		for(int k=6; k>0; k--) {
			for(int l=0; l<k; l++) {
				System.out.print("*");
			}
			System.out.println("\n");
		}
	}
}
