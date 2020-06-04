package second.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("AdminBoardDAO")
public class AdminBoardDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return (List<Map<String, Object>>)selectPagingList("adminBoard.boardList", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("adminBoard.boardDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return (List<Map<String, Object>>)selectPagingList("adminBoard.noticeList", map);
	}
	
	public void deleteNotice(Map<String, Object> map) throws Exception{
		update("adminBoard.noticeDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return (List<Map<String, Object>>)selectPagingList("adminBoard.qnaList", map);
	}
	
	public void deleteQna(Map<String, Object> map) throws Exception{
		update("adminBoard.qnaDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReport(Map<String, Object> map) throws Exception{
		return (Map<String,Object>)selectOne("adminBoard.selectReport", map);
	}
	
	public void qnaRePro(Map<String, Object> map) throws Exception{
		insert("adminBoard.qnaRePro", map);
	}

}
