package second.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminMemberService {

	List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> reportModifyList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectMember(Map<String, Object> map) throws Exception;
	
	void updateMemberInfo(Map<String, Object> map) throws Exception;
	
	void memberDelete(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> reportList(Map<String, Object> map) throws Exception;
	
	void updateReport(Map<String, Object> map) throws Exception;
	
	void deleteReport(Map<String, Object> map) throws Exception;

}
