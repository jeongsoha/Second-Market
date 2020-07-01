package second.member.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	int selectPwCheck(Map<String, Object> map) throws Exception;
	Map<String, Object> selectAccountInfo(Map<String, Object> map) throws Exception;
	void updateAccountModify(Map<String, Object> map) throws Exception;
	void updatePwModify(Map<String, Object> map) throws Exception;
	void deleteAccount(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyReportList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyReportDetail(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyQnaList(Map<String, Object> map) throws Exception;
	Map<String, Object> selectMyQnaDetail(Map<String, Object> map) throws Exception;
	
	//(유진추가) 나의 평점 받아오기 위한 서비스 선언
	Map<String, Object> selectAccountGrade(Map<String, Object> map) throws Exception;

	
}
