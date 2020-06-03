package second.comment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import second.common.dao.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO{


	// 자유게시판 
	// 댓글 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardCommentList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("comments.selectBoardCommentList", map);
	}
	
	// 댓글 작성
	public void insertBoardComment(Map<String, Object> map) throws Exception{
		insert("comments.insertBoardComment", map);
	}
		
	// 댓글 삭제
	public void deleteBoardComment(Map<String, Object> map) throws Exception{
		update("comments.deleteBoardComment", map);
	}

	
	// 상점 댓글
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsCommentList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("comments.selectGoodsCommentList", map);
	}

	public void insertGoodsComment(Map<String, Object> map) throws Exception{
		insert("comments.insertGoodsComment", map);
	}

	public void deleteGoodsComment(Map<String, Object> map) throws Exception{
		update("comments.deleteGoodsComment", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsCommentDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("comments.selectGoodsCommentDetail", map);
	}

	public void insertGoodsCommentReply(Map<String, Object> map) throws Exception{
		insert("comments.insertGoodsCommentReply", map);
	}

	public void deleteGoodsCommentReply(Map<String, Object> map) throws Exception{
		update("comments.deleteGoodsCommentReply", map);
	}

	public void insertGoodsCommentStat(Map<String, Object> map) throws Exception{
		update("comments.insertGoodsCommentStat", map);
	}

	public void deleteGoodsCommentStat(Map<String, Object> map) throws Exception{
		update("comments.deleteGoodsCommentStat", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsCommentReply(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("comments.selectGoodsCommentReply", map);
	}
}
