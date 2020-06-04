package second.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminBoardService {
	
	List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception;
	
	void deleteBoard(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;
	
	void deleteNotice(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;

	void deleteQna(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectReport(Map<String, Object> map) throws Exception;
	
	void qnaRePro(Map<String, Object> map) throws Exception;
}
