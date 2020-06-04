package second.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import second.admin.dao.AdminBoardDAO;

@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService{
	
	@Resource(name="AdminBoardDAO")
	private AdminBoardDAO adminBoardDAO;
	
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		
		return adminBoardDAO.boardList(map);
	}
	
	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		adminBoardDAO.deleteBoard(map);
	}
	
	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		
		return adminBoardDAO.noticeList(map);
	}
	
	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		adminBoardDAO.deleteNotice(map);
	}
	
	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		
		return adminBoardDAO.qnaList(map);
	}
	
	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		adminBoardDAO.deleteQna(map);
	}
	
	@Override
	public Map<String, Object>selectReport(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) adminBoardDAO.selectReport(map);
	}
	
	@Override
	public void qnaRePro(Map<String, Object> map) throws Exception {
		adminBoardDAO.qnaRePro(map);
	}

}
