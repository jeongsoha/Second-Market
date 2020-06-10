package second.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("report.selectReportList", map);
	}
	public void insertReportBoard(Map<String, Object> map)throws Exception {//insertnotice
		// TODO Auto-generated method stub
		insert("report.insertReportBoard",map);
		
	}
	public void updateReportCount(Map<String, Object> map) throws Exception{//
		// TODO Auto-generated method stub
		update("report.updateCount",map);
		
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("report.selectReportDetail", map);

	}
	public void deleteReport(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("report.deleteReport",map);
		
	}
	public void insertFile(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		insert("report.insertFile",map);
		
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("report.selectFileList", map);
	}
	
	public void updateStatus(Map<String, Object> map) throws Exception{
        // TODO Auto-generated method stub
        update("report.updateStatus",map);
      
    }
	

}
