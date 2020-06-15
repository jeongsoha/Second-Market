package second.myshop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("myshopDAO")
public class MyshopDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyOrderList1(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMyOrderList1", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyOrderList2(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMyOrderList2", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyOrderList3(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMyOrderList3", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMySaleList1(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMySaleList1", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMySaleList2(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMySaleList2", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMySaleList3(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("myshop.selectMySaleList3", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("myshop.selectLikeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecentGoodsList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("myshop.selectRecentGoodsList", map);
	}
	
	public void insertDnum(Map<String, Object> map) throws Exception{
		update("myshop.updateOrderDnum", map);
	}
	
	public void buyComplete(Map<String, Object> map) throws Exception{
		update("myshop.updateOrderStatus", map);
		update("shop.updateGoodsTstatus_END", map);
		
	}
	
	public void orderCancel(Map<String, Object> map) throws Exception{
		update("myshop.orderCancel", map);
		update("myshop.cancelTstatus", map);
	}
	
	public void cancelTstatus(Map<String, Object> map) throws Exception{
		update("myshop.cancelTstatus", map);
	}
}
