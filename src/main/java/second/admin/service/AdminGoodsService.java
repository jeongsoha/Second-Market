package second.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminGoodsService {
	
	List<Map<String, Object>> goodsList(Map<String, Object> map) throws Exception;
	
	void deleteGoods(Map<String, Object> map) throws Exception;

}
