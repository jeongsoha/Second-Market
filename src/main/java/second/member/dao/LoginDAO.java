package second.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.selectId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findIdWithEmail", map);
	}
	
	public int findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)selectOne("login.findId", map);
	}

	
	public int findPwWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)selectOne("login.findPwWithEmail", map);
	}

	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("login.updateTempPw",map);
	}

}
