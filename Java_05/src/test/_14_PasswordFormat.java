package test;

public class _14_PasswordFormat {
	

	// 멤버변수
		private String pw;


		// getter
		public String getPW(){
			return pw;
		}


		// setter
		public void setPW(String pw) throws _14_PasswordFormatException{
			if(pw == null || pw.trim().isEmpty()){
				throw new _14_PasswordFormatException(" password null 불가 ");
			}
			else if(pw.length() <10 || pw.length() > 20){
				throw new _14_PasswordFormatException("비밀번호는 10자 이상, 20자 이하로 입력하세요. ");
			}
			this.pw =pw;
		}

}
