package ch02;

public class _06_SwitchCaseEx {
	public static void main(String[] args) {
	
		int score = 100;
		char grade = ' ';
		if ((score > 100) || (score < 0)) { // 논리합 : 둘중 하나만 참이어도 참
			grade = 'W';
			
		} else {
			switch (score / 10) {
				case 10:
				case 9:
					grade = 'A';
					break;
				case 8:
					grade = 'B';
					break;
				case 7:
					grade = 'C';
					break;
				case 6:
					grade = 'D';
					break;
				default:
					grade = 'F';
			}
		}

		System.out.println(score + " : " + grade);
    }
}
