package jdbc.mvc.dao;

import java.util.List;

import jdbc.mvc.dto.LOLDTO;

public interface LOLDAO {

	// 1. 챔피언 검색
	public List<LOLDTO> daoSelectChamp(String champName);
					
	// 2. 라인별 챔피언 검색
	public List<LOLDTO> daoSelectLine(String mainLine);
					
	// 3. 전체 챔피언 조회
	public List<LOLDTO> daoAllChamp();
	
	// 4. 챔피언 추가
	public int daoAddChamp(LOLDTO dto);

	// 5. 챔피언 수정
	public int daoUpdateChamp(int champId, LOLDTO dto);
				
	// 6. 챔피언 삭제
	public int daoDeleteChamp(int champId);
	
	// 7. 메타 챔피언 추천
	public List<LOLDTO> daoMetaChamp(int lineNum);
	
	// 8. 챔피언 비교
	public List<LOLDTO> daoCompareChamp(String champName, String champName2);
	
}
