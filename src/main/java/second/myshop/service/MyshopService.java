package second.myshop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

public interface MyshopService {
	
	public List<Map<String, Object>> selectMyOrderList1(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMyOrderList2(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMyOrderList3(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectRecentGoodsList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMySaleList1(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMySaleList2(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectMySaleList3(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectMyOrderDetail(Map<String, Object> map)throws Exception;
	public Map<String, Object> selectMyOrderInfo(Map<String, Object> map) throws Exception;
	void updateMyOrderModify(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectMyReviewList(Map<String, Object> map) throws Exception; //(유진추가) 판매자 아이디를 받기 위한 서비스 선언 
	
	void insertDnum(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void buyComplete(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void orderCancel(Map<String, Object> map, HttpServletRequest request) throws Exception;
	

}
