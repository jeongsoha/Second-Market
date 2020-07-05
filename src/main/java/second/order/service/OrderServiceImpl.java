package second.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import second.common.dao.InformDAO;
import second.common.util.FileUtils;
import second.order.dao.OrderDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
	@Override
	public Map<String, Object> orderWriteForm(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> orderG = orderDAO.orderG(map);
		Map<String, Object> orderM = orderDAO.orderM(map); 
		resultMap.put("orderG", orderG);
		resultMap.put("orderM", orderM);
		
		List<Map<String, Object>> list = orderDAO.selectFileList(map);
		resultMap.put("list", list);
		 
		return resultMap;
	}

	@Override
	public void insertOrder(Map<String, Object> map, HttpServletRequest request) throws Exception {
				
		orderDAO.insertOrder(map);
		informDAO.informinsertSeller(map, "내가 올린 상품 중 결제 진행된 상품이 있습니다.");
	}
	
	@Override
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> order = orderDAO.orderDetail(map);
		resultMap.put("order", order);
		
		Map<String, Object> orderG = orderDAO.orderG(map);
		Map<String, Object> orderM = orderDAO.orderM(map); 
		
		resultMap.put("orderG", orderG);
		resultMap.put("orderM", orderM);
		
		return resultMap;
		
	}
	
	@Override
	public void reviewgo(Map<String, Object> map) throws Exception {
		System.out.println("서비스단 통과");
		orderDAO.insertreviewgo(map);
	}
	
}
