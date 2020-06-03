package second.comment.service;

import java.util.List;
import java.util.Map;

public interface CommentService {

	List<Map<String, Object>> selectBoardCommentList(Map<String, Object> map) throws Exception;

	void insertBoardComment(Map<String, Object> map) throws Exception;

	void deleteBoardComment(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectGoodsCommentList(Map<String, Object> map) throws Exception;

	void insertGoodsComment(Map<String, Object> map) throws Exception;

	void deleteGoodsComment(Map<String, Object> map) throws Exception;

	Map<String, Object> selectGoodsCommentDetail(Map<String, Object> map) throws Exception;

	void insertGoodsCommentReply(Map<String, Object> map) throws Exception;

	void deleteGoodsCommentReply(Map<String, Object> map) throws Exception;

	void insertGoodsCommentStat(Map<String, Object> map) throws Exception;

	void deleteGoodsCommentStat(Map<String, Object> map) throws Exception;

	Map<String, Object> selectGoodsCommentReply(Map<String, Object> map) throws Exception;
}
