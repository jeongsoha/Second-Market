package second.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String,Object> map) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String,Object> map) throws Exception;
	
	void insertBoardWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void updateBoardModify(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteBoard(Map<String, Object> map) throws Exception;
}
