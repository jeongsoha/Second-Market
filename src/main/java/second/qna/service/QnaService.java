package second.qna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {
	
	
	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;
	
	void insertQnaBoard(Map<String, Object> map,HttpServletRequest request)throws Exception;

	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

	void updateQna(Map<String, Object> map,HttpServletRequest request) throws Exception;

	void deleteQna(Map<String, Object> map) throws Exception;

	void insertQnaAnswer(Map<String, Object> map) throws Exception;
	
   List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)throws Exception;


	
}
