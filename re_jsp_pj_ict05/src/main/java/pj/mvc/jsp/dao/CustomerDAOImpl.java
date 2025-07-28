package pj.mvc.jsp.dao;

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO{

	
	// ID 중복 확인 처리
	@Override
	public int useridCheck(String strId) {
		return 0;
	}
	
	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		return 0;
	}
	
	// 로그인 처리 + 회원정보 인증(수정, 탈퇴용)
	@Override
	public int idPasswordChk(String strId, String password) {
		return 0;
	}

	// 회원정보 인증 처리 및 탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		return 0;
	}
	
	// 상세페이지 조회
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		return null;
	}

	// 회원정보 수정처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		return 0;
	}
	

}
