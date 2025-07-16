package jdbc.mvc.controller;

import java.util.List;
import jdbc.mvc.dto.LOLDTO;
import jdbc.mvc.service.LOLServiceImpl;
import jdbc.mvc.view.View;

public class LOLController {
	
	LOLServiceImpl service = new LOLServiceImpl();
	View view = new View();
	
	// 1. 챔피언 검색
	public void selectChamp(String champName) {
		System.out.println("controller - selectChamp()");
		List<LOLDTO> list = service.serSelectChamp(champName);
		if(!list.isEmpty()) {
			view.lolListAll(list);
		}else {
			view.lolErrorMsg("select");
		}
	}
				
	// 2. 라인별 챔피언 검색
	public void selectLine(int mainLine) {
		System.out.println("controller - selectLine()");
		List<LOLDTO> list = service.serSelectLine(mainLine);
		if(!list.isEmpty()) {
			view.lolListAll(list);
		}else {
			view.lolErrorMsg("select");
		}
	}
				
	// 3. 전체 챔피언 조회
	public void allChamp() {
		System.out.println("controller - allChamp()");
		List<LOLDTO> list = service.serAllChamp();
		if(!list.isEmpty()) {
			view.lolListAll(list);
		}else {
			view.lolErrorMsg("select");
		}
	}
				
	// 4. 챔피언 추가
	public void addChamp(LOLDTO dto) {
		System.out.println("controller - addChamp()");
		int success = service.serAddChamp(dto);
		if(success>0) {
			System.out.println(" ==== 추가성공 ==== ");
		}
		else {
			view.lolErrorMsg("insert");
		}
	}

	// 5. 챔피언 수정
	public void updateChamp(int champId, LOLDTO dto) {
		System.out.println("controller - updateChamp()");
		int success = service.serUpdateChamp(champId, dto);
		if(success > 0) {
			System.out.println(" ==== 수정성공 ==== ");
		}
		else {
			view.lolErrorMsg("update");
		}
	}
				
	// 6. 챔피언 삭제
	public void deleteChamp(int champId) {
		System.out.println("controller - deleteChamp()");
		int success = service.serDeleteChamp(champId);
		if(success > 0) {
			System.out.println(" ==== 제거 성공 ==== ");
		}
		else {
			view.lolErrorMsg("delete");
		}
	}
	
	// 7. 메타 챔피언 추천
	public void metaChampRcmm(int lineNum) {
		System.out.println("controller - metaChampRcmm()");
		List<LOLDTO> list = service.serMetaChamp(lineNum);
		if(!list.isEmpty()) {
			view.lolListAll(list);
		}
		else {
			view.lolErrorMsg("select");
		}
	}
				
	// 8. 챔피언 비교
	public void compareChamp(String champName, String champName2) {
		System.out.println("controller - compareChamp()");
		List<LOLDTO> list = service.serCompareChamp(champName, champName2);
		if(!list.isEmpty()) {
			view.comparechamp(list);
		}
		else {
			view.lolErrorMsg("select");
		}
	}
}
