package second.admin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import second.admin.dao.AdminMemberDAO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.memberList(map);
	}
	
	@Override
	public List<Map<String, Object>> reportModifyList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.reportModifyList(map);
	}
	
	@Override
	public Map<String, Object>selectMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) adminMemberDAO.selectMember(map);
	}
	
	@Override
	public void updateMemberInfo(Map<String, Object> map) throws Exception{
		adminMemberDAO.updateMemberInfo(map);
	}
	
	@Override
	public void memberDelete(Map<String, Object> map) throws Exception{
		adminMemberDAO.memberDelete(map);
	}
	
	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.reportList(map);
	}
	
	@Override
	public void updateReport(Map<String, Object> map) throws Exception{
		adminMemberDAO.updateReport(map);
	}
	
	@Override
	public void deleteReport(Map<String, Object> map) throws Exception{
		adminMemberDAO.deleteReport(map);
	}
}
