package jdbc.mvc.service;

import java.util.ArrayList;
import java.util.List;

import jdbc.mvc.dao.LOLDAOImpl;
import jdbc.mvc.dto.LOLDTO;

public class LOLServiceImpl implements LOLService{

	/* LOLDAOImpl dao = new LOLDAOImpl(); */
	LOLDAOImpl dao = LOLDAOImpl.getInstance();
	
	@Override
	public List<LOLDTO> serSelectChamp(String champName) {
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		list = dao.daoSelectChamp(champName);
		return list;
	}

	@Override
	public List<LOLDTO> serSelectLine(int mainLine) {
		String lineNum = null;
		switch(mainLine) {
		case 1:
			lineNum = "탑";
			break;
		case 2:
			lineNum = "정글";
			break;
		case 3:
			lineNum = "미드";
			break;
		case 4:
			lineNum = "원딜";
			break;
		case 5:
			lineNum = "서폿";
			break;
		}
		List<LOLDTO> list = dao.daoSelectLine(lineNum);
		return list;
	}

	@Override
	public List<LOLDTO> serAllChamp() {
		List<LOLDTO> list = dao.daoAllChamp();
		return list;
		
	}

	@Override
	public int serAddChamp(LOLDTO dto) {
		int success = dao.daoAddChamp(dto);
		return success;
	}

	@Override
	public int serUpdateChamp(int champId, LOLDTO dto) {
		int success = dao.daoUpdateChamp(champId, dto);
		return success;
	}

	@Override
	public int serDeleteChamp(int champId) {
		int success = dao.daoDeleteChamp(champId);
		return success;
		
	}

	@Override
	public List<LOLDTO> serMetaChamp() {
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		list = dao.daoMetaChamp();
		return list;
	}

	@Override
	public List<LOLDTO>  serCompareChamp(String champName, String champName2) {
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		list = dao.daoCompareChamp(champName, champName2);
		return list;
	}

}
