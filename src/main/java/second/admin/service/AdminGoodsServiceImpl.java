package second.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import second.common.util.FileUtils;
import second.admin.dao.AdminGoodsDAO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService{

	@Resource(name="AdminGoodsDAO")
	private AdminGoodsDAO adminGoodsDAO;
	
	@Override
	public List<Map<String, Object>> goodsList(Map<String, Object> map) throws Exception {
		
		return adminGoodsDAO.goodsList(map);
	}
	
	@Override
	public void deleteGoods(Map<String, Object> map) throws Exception {
		adminGoodsDAO.deleteGoods(map);
	}
	
}
