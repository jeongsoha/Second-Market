package second.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderG(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderWriteG", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderM(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderWriteM", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("shop.selectFileList", map);
	}

	public void insertOrder(Map<String, Object> map) throws Exception{
		insert("order.insertOrder", map);
		update("shop.updateGoodsTstatus_ING", map);
	}
	
	public void insertreviewgo(Map<String, Object> map) throws Exception{
		System.out.println("DAO단 통과1");
		insert("order.insertreviewgo", map);
		update("order.updateReviewYesOrNo", map);
		System.out.println("DAO단 통과2");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderDetail", map);
	}
	
}
