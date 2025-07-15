package useBean;

import java.util.Date;

public class MemberInfo {

	
	// 멤버변수
	private String id;				// 아이디
	private String password;		// 비밀번호
	private String name;			// 이름
	private String address;			// 주소
	private String email;			// 이메일
	private Date registerDate;		// 가입일
	
	// 디폴트 생성자
	public MemberInfo() {
		super();
	}

	// 매개변수 생성자
	public MemberInfo(String id, String password, String name, String address, String email, Date registerDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.registerDate = registerDate;
	}

	// getter : 값을 읽어올 때 사용하는 메서드
	
	// setter : 값을 저장할 때 사용하는 메서드
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	
	// toString()
	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address
				+ ", email=" + email + ", registerDate=" + registerDate + "]";
	}
	
}
