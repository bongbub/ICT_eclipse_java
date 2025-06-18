package ch09_re;

// 2025.6.11

public class _01_ArrayException {
	public static void main(String[] args) {
		
		try {
			int[] arr = new int[5];
			for(int i = 0; i<=arr.length; i++ ) {
				arr[i] = i;
				System.out.println(arr[i]);
			}
		}
		catch(ArrayIndexOutOfBoundsException e){
				System.out.println(e);
				System.out.println(e.getMessage());
			}
		finally {
			System.out.println("finally 부분");
		}
		System.out.println("정상출력");
		}
}

