package second.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	public int selectEmailCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Integer)selectOne("join.selectEmailCheck",map);
	}
	
	public int selectIdCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Integer)selectOne("join.selectIdCheck",map);
	}
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertMember",map);
	}
	public void verifyMember(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("join.updateVerify",map);
	}

}
