package second.member.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception;

	public int findId(Map<String, Object> map) throws Exception;
	
	public int findPwWithEmail(Map<String, Object> map) throws Exception;

	public void updateTempPw(Map<String,Object> map) throws Exception;

}
