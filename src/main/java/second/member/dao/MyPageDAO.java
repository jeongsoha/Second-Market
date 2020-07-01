package second.member.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import second.common.dao.AbstractDAO;

@Repository("myPageDAO")
public class MyPageDAO extends AbstractDAO{
	
	public int selectPwCheck(Map<String, Object> map) throws Exception{
		return (Integer) selectOne ("mypage.selectPwCheck", map); 
	}
	
	public Map<String, Object> selectAccountInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne ("mypage.selectAccountInfo", map);
	}
	
	public void updateAccountModify(Map<String, Object> map) throws Exception{
		update("mypage.updateAccountModify", map);
	}
	
	public void updatePwModify(Map<String, Object> map) throws Exception{
		update("mypage.updatePwModify", map);
	}
	
	public void deleteAccount(Map<String, Object> map) throws Exception{
		update("mypage.deleteAccount", map);
	}
	
	public Map<String, Object> selectMyReportList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectList ("mypage.selectMyReportList", map);
	}
	
	public Map<String, Object> selectMyReportDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne ("mypage.selectMyReportDetail", map);
	}
	
	public Map<String, Object> selectMyQnaList(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectList ("mypage.selectMyQnaList", map);
	}
	
	public Map<String, Object> selectMyQnaDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne ("mypage.selectMyQnaDetail", map);
	}
	
	//(유진추가) 나의 평점 받아오기 위한 DAO
	public Map<String, Object> selectAccountGrade(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne ("mypage.selectAccountGrade", map);
	}

}
