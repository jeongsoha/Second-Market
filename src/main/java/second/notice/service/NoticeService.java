package second.notice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {
	
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectNoticeDetail(Map<String, Object> map)throws Exception;
	
	void insertNoticeWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void updateNoticeModify(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteNotice(Map<String, Object> map) throws Exception;
}
