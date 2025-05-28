package ch02;

public class _06_SwitchCaseEx3 {
	public static void main(String[] args) {
	
		 int  score = 100;
	     char grade='A';

	      switch(score/10) {
	         case 10:
	                  if(score == 100) {
	                     grade = 'A';
	                  } else {		// 101~109
	                     grade = 'W';
	                  }
	                  break;   
	         case 9:      grade = 'A';
	                  break;
	         case 8:      grade = 'B';      
	                  break;
	         case 7:      grade = 'C';      
	                  break;            
	         case 6:      grade = 'D';         
	                  break;
	         case 5:
	         case 4:
	         case 3:
	         case 2:
	         case 1:
	         case 0:  grade = 'F';
	                  break;
	         default:   grade = 'W';
	                  break;                        
	      }
	      
	      System.out.println("점수 : "+score+ ", 학점 :" + grade);      // 점수 : 110, 학점 : W

		
    }
}
