package second.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface OrderService {
	
	Map<String, Object> orderWriteForm(Map<String, Object> map) throws Exception;
	
	void insertOrder(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void reviewgo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> orderDetail(Map<String, Object> map) throws Exception;

}
