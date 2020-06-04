package second.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{

	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("adminMember.memberList", map);
	}
	
	public List<Map<String, Object>> reportModifyList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("adminMember.reportModifyList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception{
		return (Map<String,Object>)selectOne("adminMember.selectMember", map);
	}
	
	public void updateMemberInfo(Map<String, Object> map) throws Exception{
		update("adminMember.updateMemberInfo", map);
	}
	
	public void memberDelete(Map<String, Object> map) throws Exception{
		update("adminMember.memberDelete", map);
	}
	
	public List<Map<String, Object>> reportList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("adminMember.reportList", map);
	}
	
	public void updateReport(Map<String, Object> map) throws Exception{
		update("adminMember.updateReport", map);
	}
	
	public void deleteReport(Map<String, Object> map) throws Exception{
		update("adminMember.reportDelete", map);
	}
}
