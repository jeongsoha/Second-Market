package second.report.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReportService {
	
	List<Map<String, Object>> selectReportList(Map<String, Object> map, String search) throws Exception;
	
	Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception;

	void insertReportBoard(Map<String, Object> map, HttpServletRequest request)throws Exception;
	
	void deleteReport(Map<String, Object> map) throws Exception;

	void updateStatus(Map<String, Object> map) throws Exception;

}
