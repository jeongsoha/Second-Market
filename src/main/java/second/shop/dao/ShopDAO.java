package second.shop.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("shopDAO")
public class ShopDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return (List<Map<String, Object>>)selectPagingList("shop.selectGoodsList", map);
	} 

	public void insertGoods(Map<String, Object> map) throws Exception{
		insert("shop.insertGoods", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("shop.insertFile", map);
	}
	
	public void insertGoodsThumbnail(Map<String, Object> map) throws Exception{
		update("shop.updateGoodsThumbnail", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("shop.updateHitCnt", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("shop.selectGoodsDetail", map);
	}
	
	@SuppressWarnings("unchecked") //(유진추가) 신고당한 게시글을 알아보기 위한 DAO
	public Map<String, Object> selectGoodsReport(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("shop.selectGoodsReport", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectAccountInfo", map);
	}
	
	public void updateGoods(Map<String, Object> map) throws Exception{
		System.out.println(map);
		update("shop.updateGoods", map);
	}
	
	public void deleteGoods(Map<String, Object> map) throws Exception{
		update("shop.goodsDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("shop.selectFileList", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception{ 
		update("shop.deleteFileList", map); 
	} 
	
	public void updateFile(Map<String, Object> map) throws Exception{ 
		update("shop.updateFile", map); 
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsLike(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("shop.selectGoodsLike", map);
	}
	
	public void insertGoodsLike(Map<String, Object> map) throws Exception{
		insert("shop.insertGoodsLike", map);
	}
	
	public void deleteGoodsLike(Map<String, Object> map) throws Exception{
		delete("shop.deleteGoodsLike", map);
	}
}
