package second.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("AdminGoodsDAO")
public class AdminGoodsDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsList(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return (List<Map<String, Object>>)selectPagingList("adminGoods.goodsList", map);
	}
	
	public void deleteGoods(Map<String, Object> map) throws Exception{
		update("adminGoods.goodsDelete", map);
	}

}
