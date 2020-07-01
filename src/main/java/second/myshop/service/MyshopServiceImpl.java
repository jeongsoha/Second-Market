package second.myshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

//import second.report.dao.ReportDAO;
import second.myshop.dao.MyshopDAO;
import second.shop.dao.ShopDAO;

@Service("myshopService")
public class MyshopServiceImpl implements MyshopService{
	
	@Resource(name="myshopDAO")
	private MyshopDAO myshopDAO;
	
	
	@Override
	public List<Map<String, Object>> selectMyOrderList1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList1(map);
	}
	@Override
	public List<Map<String, Object>> selectMyOrderList2(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList2(map);
	}
	@Override
	public List<Map<String, Object>> selectMyOrderList3(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMyOrderList3(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMySaleList1(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList1(map);
	}
	@Override
	public List<Map<String, Object>> selectMySaleList2(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList2(map);
	}
	@Override
	public List<Map<String, Object>> selectMySaleList3(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectMySaleList3(map);
	}
	
	@Override
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectLikeList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectRecentGoodsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myshopDAO.selectRecentGoodsList(map);
	}
	
	@Override
	public void insertDnum(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.insertDnum(map);
	}

	/* 수취완료 */
	@Override
	public void buyComplete(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.buyComplete(map);
		
	}
	
	@Override
	public void orderCancel(Map<String, Object> map, HttpServletRequest request) throws Exception {
		myshopDAO.orderCancel(map);
	}
	
	@Override
	public Map<String, Object> selectMyOrderDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = myshopDAO.selectMyOrderDetail(map);
		resultMap.put("map", tempMap);		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectMyOrderInfo(Map<String, Object> map) throws Exception{
		return myshopDAO.selectMyOrderInfo(map);
	}
	
	@Override
	public void updateMyOrderModify(Map<String, Object> map) throws Exception{
		myshopDAO.updateMyOrderModify(map);
	}
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception {
		return myshopDAO.selectMyReviewList(map);
	}
	
	
}
