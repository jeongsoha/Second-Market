package second.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import second.comment.dao.CommentDAO;
import second.common.dao.InformDAO;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="informDAO")
	private InformDAO informDAO;
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;

	@Override
	public List<Map<String, Object>> selectBoardCommentList(Map<String, Object> map) throws Exception {
		return commentDAO.selectBoardCommentList(map);
	}

	@Override
	public void insertBoardComment(Map<String, Object> map) throws Exception {
		System.out.println("===============DAO 확인===================");
		commentDAO.insertBoardComment(map);
		 
	}

	@Override
	public void deleteBoardComment(Map<String, Object> map) throws Exception {
		commentDAO.deleteBoardComment(map);
	}

	@Override
	public List<Map<String, Object>> selectGoodsCommentList(Map<String, Object> map) throws Exception {
		return commentDAO.selectGoodsCommentList(map);
	}

	@Override
	public void insertGoodsComment(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsComment(map);
		informDAO.informInsert(map, "내 판매상품에 댓글이 달렸습니다."); //(유진추가) goodsDetail.jsp 에서 받아온 id 값을 서비스에 전달
	}

	@Override
	public void deleteGoodsComment(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsComment(map);
	}

	@Override
	public Map<String, Object> selectGoodsCommentDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = commentDAO.selectGoodsCommentDetail(map);
		resultMap.put("map", tempMap);
		resultMap.put("reply", tempMap.get("COMMENTS_REPLY"));
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectGoodsCommentReply(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = commentDAO.selectGoodsCommentReply(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public void insertGoodsCommentReply(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsCommentReply(map);
		informDAO.informInsert(map, "내 문의글에 답글이 달렸습니다."); //(유진추가) commentDetail.jsp 에서 받아온 id 값을 서비스에 전달
	}

	@Override
	public void deleteGoodsCommentReply(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsCommentReply(map);
	}

	@Override
	public void insertGoodsCommentStat(Map<String, Object> map) throws Exception {
		commentDAO.insertGoodsCommentStat(map);
	}

	@Override
	public void deleteGoodsCommentStat(Map<String, Object> map) throws Exception {
		commentDAO.deleteGoodsCommentStat(map);
	}
}
