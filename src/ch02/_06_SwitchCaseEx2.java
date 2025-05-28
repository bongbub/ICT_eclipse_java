package ch02;

public class _06_SwitchCaseEx2 {
	public static void main(String[] args) {
	
	   int score = 105;
	   char grade=' ';	      
         switch(score/10) {
         case 10:
             switch (score % 10) {  // 나머지
                case 0:  // 100
                   grade = 'A';
                   break;
                default:
                   grade = 'W';   // 101~109
             }
             break;
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
          case 5:
          case 4:
          case 3:
          case 2:
          case 1:
          case 0:
             grade = 'F';
             break;
          default:
             grade = 'W'; // 음수일때, 110일때
       }
       System.out.println("점수 : " + score + ", 학점 : " + grade);
		
    }
}
